$ErrorActionPreference = "Stop"

#---------------------------------------------------
# Read Version
#---------------------------------------------------

$version = (Get-Content ".\version.txt").Trim()

$parts = $version.Split('.')

$major = [int]$parts[0]
$minor = [int]$parts[1]
$patch = [int]$parts[2]

$patch++

$newVersion = "$major.$minor.$patch"

$newVersion | Set-Content ".\version.txt"

Write-Host "Version: $version -> $newVersion" -ForegroundColor Yellow

#---------------------------------------------------
# Build
#---------------------------------------------------

.\pac.ps1 -Version $newVersion

#---------------------------------------------------
# Git
#---------------------------------------------------

git add .

git commit -m "Release $newVersion"

git tag -a $newVersion -m "Release $newVersion"

git push

git push origin $newVersion

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host " Release $newVersion completed successfully" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green