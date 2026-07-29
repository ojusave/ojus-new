[CmdletBinding()]
param(
    [ValidateSet("all", "codex", "cursor")]
    [string]$Target = "all",

    [string]$ProjectRoot
)

$ErrorActionPreference = "Stop"
$SkillName = "content-graph-director"
$SkillRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$SkillFile = Join-Path $SkillRoot "SKILL.md"

if (-not (Test-Path -LiteralPath $SkillFile -PathType Leaf)) {
    throw "SKILL.md was not found beside the installer."
}

$SkillText = Get-Content -LiteralPath $SkillFile -Raw
if ($SkillText -notmatch '(?m)^name:\s*content-graph-director\s*$') {
    throw "SKILL.md does not declare name: content-graph-director."
}

if ($ProjectRoot) {
    if (-not (Test-Path -LiteralPath $ProjectRoot -PathType Container)) {
        throw "Project path does not exist: $ProjectRoot"
    }
    $BaseRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
    $CodexBase = Join-Path $BaseRoot ".agents/skills"
    $CursorBase = Join-Path $BaseRoot ".cursor/skills"
}
else {
    $UserHome = if ($HOME) { $HOME } else { [Environment]::GetFolderPath("UserProfile") }
    if (-not $UserHome) {
        throw "The user home directory could not be determined."
    }
    $CodexBase = Join-Path $UserHome ".agents/skills"
    $CursorBase = Join-Path $UserHome ".cursor/skills"
}

$Timestamp = Get-Date -Format "yyyyMMddHHmmss"

function Install-SkillCopy {
    param(
        [Parameter(Mandatory = $true)][string]$Base,
        [Parameter(Mandatory = $true)][string]$Label
    )

    New-Item -ItemType Directory -Path $Base -Force | Out-Null
    $Destination = Join-Path $Base $SkillName

    if (Test-Path -LiteralPath $Destination -PathType Container) {
        $DestinationResolved = (Resolve-Path -LiteralPath $Destination).Path
        if ([StringComparer]::OrdinalIgnoreCase.Equals($DestinationResolved, $SkillRoot)) {
            Write-Host "$Label already points to the source skill: $Destination"
            return
        }
    }

    $Temporary = Join-Path $Base ".$SkillName.install.$PID"
    if (Test-Path -LiteralPath $Temporary) {
        Remove-Item -LiteralPath $Temporary -Recurse -Force
    }

    Copy-Item -LiteralPath $SkillRoot -Destination $Temporary -Recurse -Force
    $RequiredFiles = @(
        "SKILL.md",
        "references/core-graph.md",
        "references/operations-and-delivery.md",
        "references/regression-scenarios.md",
        "scripts/content_lint.py",
        "scripts/validate_content_graph.py"
    )
    foreach ($RequiredFile in $RequiredFiles) {
        $RequiredPath = Join-Path $Temporary $RequiredFile
        if (-not (Test-Path -LiteralPath $RequiredPath -PathType Leaf)) {
            Remove-Item -LiteralPath $Temporary -Recurse -Force -ErrorAction SilentlyContinue
            throw "Copy verification failed for ${Label}: missing $RequiredFile."
        }
    }

    $Backup = $null
    if (Test-Path -LiteralPath $Destination) {
        $Backup = "$Destination.backup-$Timestamp"
        if (Test-Path -LiteralPath $Backup) {
            $Backup = "$Backup-$PID"
        }
        Move-Item -LiteralPath $Destination -Destination $Backup
    }

    try {
        Move-Item -LiteralPath $Temporary -Destination $Destination
    }
    catch {
        Remove-Item -LiteralPath $Temporary -Recurse -Force -ErrorAction SilentlyContinue
        if ($Backup -and (Test-Path -LiteralPath $Backup)) {
            Move-Item -LiteralPath $Backup -Destination $Destination -ErrorAction SilentlyContinue
        }
        throw
    }

    $InstalledText = Get-Content -LiteralPath (Join-Path $Destination "SKILL.md") -Raw
    if ($InstalledText -notmatch '(?m)^name:\s*content-graph-director\s*$') {
        throw "Installed SKILL.md failed validation at $Destination."
    }

    Write-Host "Installed for ${Label}: $Destination"
    if ($Backup) {
        Write-Host "Previous copy backed up to: $Backup"
    }
}

switch ($Target) {
    "all" {
        Install-SkillCopy -Base $CodexBase -Label "Codex"
        Install-SkillCopy -Base $CursorBase -Label "Cursor"
    }
    "codex" {
        Install-SkillCopy -Base $CodexBase -Label "Codex"
    }
    "cursor" {
        Install-SkillCopy -Base $CursorBase -Label "Cursor"
    }
}

Write-Host ""
Write-Host "Installation complete. Start a new Codex or Cursor chat so it reloads the skill catalog."
Write-Host 'Invoke it as $content-graph-director in Codex or /content-graph-director in Cursor.'
