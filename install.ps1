[CmdletBinding()]
param(
    [ValidateSet("all", "codex", "cursor")]
    [string]$Target = "all",

    [string]$ProjectRoot
)

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
    $RequiredFiles = @(
        "SKILL.md",
        "references/core-graph.md",
        "references/operations-and-delivery.md",
        "references/regression-scenarios.md",
        "scripts/install.ps1",
        "scripts/validate_content_graph.py"
    )
    foreach ($RequiredFile in $RequiredFiles) {
        if (-not (Test-Path -LiteralPath (Join-Path $SkillRoot $RequiredFile) -PathType Leaf)) {
            throw "The downloaded skill is missing $RequiredFile."
        }
    }

    $SkillText = Get-Content -LiteralPath $SkillFile.FullName -Raw
    if ($SkillText -notmatch '(?m)^name:\s*content-graph-director\s*$') {
        throw "The downloaded SKILL.md failed validation."
    }

    $Installer = Join-Path $SkillRoot "scripts/install.ps1"
    if ($ProjectRoot) {
        & $Installer -Target $Target -ProjectRoot $ProjectRoot
    }
    else {
        & $Installer -Target $Target
    }
}
finally {
    Remove-Item -LiteralPath $WorkDir -Recurse -Force -ErrorAction SilentlyContinue
}
