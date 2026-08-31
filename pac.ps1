param(
    [Parameter(Mandatory = $true)]
    [string]$Version
)

$ErrorActionPreference = "Stop"

Write-Host "Publishing OrderHub $Version..." -ForegroundColor Cyan

dotnet publish ..\OrderHub\OrderHub.UI\ `
    -c Release `
    -r win-x64 `
    -o .\Publish

if ($LASTEXITCODE -ne 0) {
    Write-Host "dotnet publish failed with exit code $LASTEXITCODE." -ForegroundColor Red
    throw "dotnet publish failed."
}

Write-Host "Building installer..." -ForegroundColor Cyan

& ISCC.exe "/DMyAppVersion=$Version" "OrderHub Installer Script.iss"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Inno Setup failed with exit code $LASTEXITCODE." -ForegroundColor Red
    throw "Inno Setup failed."
}

Write-Host "Package created successfully." -ForegroundColor Green