$instanceId = "SWD\Wintun\{143AEA73-ACA5-6C86-B5DD-16D301C1F64D}"

Write-Host "Removing Wintun device: $instanceId"
pnputil /remove-device "$instanceId"

# Replace this with the command you want to run
Write-Host "Running follow-up command..."

Set-Location "$HOME/my/dotfiles/.config/sing-box"

sing-box run -c .\ignored\1.json 2> .\ignored\asd.log