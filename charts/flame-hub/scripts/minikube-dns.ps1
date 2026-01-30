param (
    [Parameter(Mandatory = $true)]
    [string]$HubUrl,

    [Parameter(Mandatory = $true)]
    [string]$HarborUrl
)

$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Script must be executed as Administrator"
    exit 1
}

try {
    $minikubeIp = (minikube ip).Trim()
} catch {
    Write-Error "Minikube ip address could not be received."
    exit 1
}

$entriesToAdd = @(
    "$minikubeIp $HubUrl"
    "$minikubeIp $HarborUrl"
)

$hostsContent = Get-Content $hostsPath -ErrorAction Stop

foreach ($entry in $entriesToAdd) {
    if ($hostsContent -notcontains $entry) {
        Add-Content -Path $hostsPath -Value $entry
        Write-Output "Added DNS entry: $entry"
    } else {
        Write-Output "Skipped DNS entry: $entry"
    }
}
