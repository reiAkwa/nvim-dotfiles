#Requires -Version 5.1
[CmdletBinding()]
param(
    [switch]$Copy,
    [switch]$NoBootstrap
)

$ErrorActionPreference = 'Stop'

function Write-Say  { param([string]$m) Write-Host "[+] $m"  -ForegroundColor Cyan }
function Write-Ok   { param([string]$m) Write-Host "[ok] $m" -ForegroundColor Green }
function Write-Warn { param([string]$m) Write-Host "[!] $m"  -ForegroundColor Yellow }
function Write-Die  { param([string]$m) Write-Host "[x] $m"  -ForegroundColor Red; exit 1 }

$Repo = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not (Test-Path -LiteralPath (Join-Path $Repo 'init.lua'))) {
    Write-Die "$Repo does not look like this nvim config (init.lua missing)"
}

if (-not $env:LOCALAPPDATA) { Write-Die "LOCALAPPDATA is not set" }
$Target = Join-Path $env:LOCALAPPDATA 'nvim'

Write-Say "platform:      windows"
Write-Say "config target: $Target"

function Test-SamePath {
    param([string]$A, [string]$B)
    try {
        $ra = (Resolve-Path -LiteralPath $A -ErrorAction Stop).Path
        $rb = (Resolve-Path -LiteralPath $B -ErrorAction Stop).Path
        return ($ra -eq $rb)
    } catch {
        return $false
    }
}

$same = $false
if (Test-Path -LiteralPath $Target) { $same = Test-SamePath $Target $Repo }

if ($same) {
    Write-Ok "already installed: $Target is this repo"
} else {
    if (Test-Path -LiteralPath $Target) {
        $backup = "$Target.bak.$(Get-Date -Format 'yyyyMMddHHmmss')"
        Write-Warn "backing up existing config to $backup"
        Move-Item -LiteralPath $Target -Destination $backup
    }

    $linked = $false
    if (-not $Copy) {
        try {
            New-Item -ItemType SymbolicLink -Path $Target -Target $Repo -ErrorAction Stop | Out-Null
            $linked = $true
            Write-Ok "linked $Target -> $Repo"
        } catch {
            Write-Warn "symlink failed (enable Developer Mode or run as admin); copying instead"
        }
    }

    if (-not $linked) {
        Copy-Item -LiteralPath $Repo -Destination $Target -Recurse -Force
        Write-Ok "copied $Repo -> $Target"
    }
}

# --- neovim --------------------------------------------------------------
$nvim = Get-Command nvim -ErrorAction SilentlyContinue
if ($nvim) {
    $ver = (& nvim --version | Select-Object -First 1) -replace '[^0-9.]', ''
    $parts = $ver.Split('.')
    $major = [int]$parts[0]
    $minor = if ($parts.Count -gt 1) { [int]$parts[1] } else { 0 }
    if ($major -gt 0 -or $minor -ge 12) {
        Write-Ok "neovim $ver"
    } else {
        Write-Warn "neovim $ver found, but vim.pack requires >= 0.12"
    }
} else {
    Write-Warn "neovim not found: https://github.com/neovim/neovim/releases"
}

# --- optional dependencies ----------------------------------------------
foreach ($dep in 'git', 'rg', 'tree-sitter') {
    if (Get-Command $dep -ErrorAction SilentlyContinue) { Write-Ok "$dep found" }
    else { Write-Warn "$dep not found (optional)" }
}
foreach ($cc in 'cc', 'gcc', 'clang', 'cl') {
    if (Get-Command $cc -ErrorAction SilentlyContinue) { Write-Ok "C compiler: $cc"; break }
}

# --- bootstrap plugins ---------------------------------------------------
if (-not $NoBootstrap -and $nvim) {
    Write-Say "installing plugins (first launch may take a while)..."
    try { & nvim --headless "+qa" | Out-Null }
    catch { Write-Warn "plugin bootstrap failed; open nvim and run :checkhealth" }
}

Write-Ok "done. open nvim to finish setup."
