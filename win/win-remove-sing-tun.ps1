# Hardcoded device description
$targetDescription = "sing-tun Tunnel"

$lines = pnputil /enum-devices /class Net
$deviceBlock = @()
$instanceId = $null

foreach ($line in $lines) {
    if ($line -match "^\s*$") {
        # End of a device block
        $blockText = $deviceBlock -join "`n"
        if ($blockText -like "*Device Description:*$targetDescription*") {
            foreach ($entry in $deviceBlock) {
                if ($entry -like "*Instance ID:*") {
                    $instanceId = $entry -replace "^\s*Instance ID:\s*", ""
                    break
                }
            }
            break
        }
        $deviceBlock = @()
    } else {
        $deviceBlock += $line
    }
}

if ($instanceId) {
    Write-Output $instanceId
    pnputil /remove-device "$instanceId"
} else {
    Write-Error "Device '$targetDescription' not found or missing Instance ID."
}