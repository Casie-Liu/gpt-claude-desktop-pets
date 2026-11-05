[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$CodexHome
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        $CodexHome = $env:CODEX_HOME
    } else {
        $CodexHome = Join-Path ([Environment]::GetFolderPath('UserProfile')) '.codex'
    }
}

$packageRoot = Split-Path -Parent $PSScriptRoot
$petsRoot = Join-Path ([IO.Path]::GetFullPath($CodexHome)) 'pets'
$packages = @(
    @{ Name = 'gpt-niang'; Files = @('pet.json', 'spritesheet.webp', 'LICENSE') },
    @{ Name = 'claude-niang'; Files = @('pet.json', 'spritesheet.png') }
)

# Preflight both packages before copying anything. Existing different files are
# never overwritten, and this script does not change the active pet or account.
foreach ($package in $packages) {
    $source = Join-Path (Join-Path $packageRoot 'pets') $package.Name
    $destination = Join-Path $petsRoot $package.Name
    foreach ($name in $package.Files) {
        $sourceFile = Join-Path $source $name
        if (-not (Test-Path -LiteralPath $sourceFile -PathType Leaf)) {
            throw "Missing package file: $sourceFile. Extract the complete ZIP first."
        }
    }
    $manifest = Get-Content -LiteralPath (Join-Path $source 'pet.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($manifest.spriteVersionNumber -ne 2 -or $manifest.spritesheetPath -ne $package.Files[1]) {
        throw "Invalid v2 pet manifest in $source"
    }
    if (Test-Path -LiteralPath $destination) {
        if (-not (Test-Path -LiteralPath $destination -PathType Container)) {
            throw "Destination is not a folder: $destination"
        }
        foreach ($name in $package.Files) {
            $existingFile = Join-Path $destination $name
            if (-not (Test-Path -LiteralPath $existingFile -PathType Leaf)) {
                throw "A different or incomplete pet already exists at $destination. Rename that folder before installing."
            }
            if ((Get-FileHash -LiteralPath $existingFile -Algorithm SHA256).Hash -ne
                (Get-FileHash -LiteralPath (Join-Path $source $name) -Algorithm SHA256).Hash) {
                throw "A different pet already exists at $destination. Rename that folder before installing."
            }
        }
        $package.AlreadyInstalled = $true
    } else {
        $package.AlreadyInstalled = $false
    }
}

foreach ($package in $packages) {
    $source = Join-Path (Join-Path $packageRoot 'pets') $package.Name
    $destination = Join-Path $petsRoot $package.Name
    if ($package.AlreadyInstalled) {
        Write-Host "Already installed: $($package.Name)"
        continue
    }
    if ($PSCmdlet.ShouldProcess($destination, 'Install native pet files')) {
        New-Item -ItemType Directory -Path $destination -Force | Out-Null
        foreach ($name in $package.Files) {
            Copy-Item -LiteralPath (Join-Path $source $name) -Destination (Join-Path $destination $name)
        }
        Write-Host "Installed: $($package.Name)"
    }
}

Write-Host "Pet folder: $petsRoot"
Write-Host 'Next: restart Codex, then open Settings > Pets and select GPT or Claude.'
Write-Host 'This package needs a Codex desktop build with native custom pets support.'
