$ErrorActionPreference = 'Continue'
Set-Location 'C:\Users\Admin\nebravia-deploy\media-v4'
Remove-Item vercel.json -ErrorAction SilentlyContinue
'' | Out-File .nojekyll -Encoding ascii
if (-not (Test-Path .git)) { cmd /c "git init -b main 2>&1" }
cmd /c "git config user.name nebravia-bot 2>&1"
cmd /c "git config user.email armando40business@gmail.com 2>&1"
cmd /c "git add -A 2>&1"
cmd /c "git commit -m ""Nebravia Reels v4 - Medienhost fuer Metricool-Import"" 2>&1"
cmd /c "gh repo create nebravia-media --public --source=. --push --description ""Nebravia Reel-Medien (statischer Host)"" 2>&1"
Start-Sleep -Seconds 3
cmd /c "gh api -X POST repos/armando40business-code/nebravia-media/pages -f source[branch]=main -f source[path]=/ 2>&1"
cmd /c "gh api repos/armando40business-code/nebravia-media/pages 2>&1"
Write-Host PUBLISH-DONE
