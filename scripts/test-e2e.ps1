param(
    [string]$Rvpm = "rvpm",
    [switch]$Keep
)

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot
Push-Location $repo
try {
    docker compose up -d --wait
    $env:RAVEN_MYSQL_E2E = "1"
    $env:RAVEN_MYSQL_HOST = "127.0.0.1"
    $env:RAVEN_MYSQL_PORT = if ($env:RAVEN_MYSQL_PORT) { $env:RAVEN_MYSQL_PORT } else { "33306" }
    $env:RAVEN_MYSQL_USER = "raven"
    $env:RAVEN_MYSQL_PASSWORD = "ravenpw"
    $env:RAVEN_MYSQL_DATABASE = "ravendb"
    & $Rvpm test
    if ($LASTEXITCODE -ne 0) {
        throw "rvpm test failed with exit code $LASTEXITCODE"
    }
} finally {
    if (-not $Keep) {
        docker compose down --volumes
    }
    Pop-Location
}

