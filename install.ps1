[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$SkillName = "content-graph-director"
$Repository = "ojusave/ojus-new"
$Ref = if ($env:CONTENT_GRAPH_DIRECTOR_REF) { $env:CONTENT_GRAPH_DIRECTOR_REF } else { "main" }
$ArchiveUrl = if ($env:CONTENT_GRAPH_DIRECTOR_ARCHIVE_URL) {
    $env:CONTENT_GRAPH_DIRECTOR_ARCHIVE_URL
}
else {
    "https://codeload.github.com/$Repository/zip/refs/heads/$Ref"
}

$WorkDir = Join-Path ([System.IO.Path]::GetTempPath()) "$SkillName.install.$PID"
$ArchivePath = Join-Path $WorkDir "repository.zip"
$ExtractDir = Join-Path $WorkDir "extracted"

try {
    New-Item -ItemType Directory -Path $WorkDir -Force | Out-Null
    New-Item -ItemType Directory -Path $ExtractDir -Force | Out-Null

    Invoke-WebRequest -UseBasicParsing -Uri $ArchiveUrl -OutFile $ArchivePath
    Expand-Archive -LiteralPath $ArchivePath -DestinationPath $ExtractDir -Force

    $SkillFile = Get-ChildItem -LiteralPath $ExtractDir -Filter "SKILL.md" -File -Recurse |
        Where-Object { $_.FullName -like "*\skills\$SkillName\SKILL.md" } |
        Select-Object -First 1

    if (-not $SkillFile) {
        throw "The repository archive does not contain skills/$SkillName/SKILL.md."
    }

    $SkillRoot = $SkillFile.Directory.FullName
    $Installer = Join-Path $SkillRoot "scripts/install.ps1"
    if (-not (Test-Path -LiteralPath $Installer -PathType Leaf)) {
        throw "The downloaded skill does not contain its installer."
    }

    $SkillText = Get-Content -LiteralPath $SkillFile.FullName -Raw
    if ($SkillText -notmatch '(?m)^name:\s*content-graph-director\s*$') {
        throw "The downloaded SKILL.md failed validation."
    }

    & $Installer -Target all
}
finally {
    Remove-Item -LiteralPath $WorkDir -Recurse -Force -ErrorAction SilentlyContinue
}
