Param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('Local', 'AzureDevOps', 'GithubActions', 'GitLab')]
    [string] $environment = 'Local'
)

. (Join-Path $PSScriptRoot "Read-Settings.ps1") -environment $environment
. (Join-Path $PSScriptRoot "Install-BcContainerHelper.ps1") -bcContainerHelperVersion $bcContainerHelperVersion

$refreshToken = "$($ENV:BcSaasRefreshToken)"
$environmentName = "$($ENV:EnvironmentName)"

if ($refreshToken -and $environmentName) {
    $authContext = New-BcAuthContext -refreshToken $refreshToken
    if (Get-BcEnvironments -bcAuthContext $authContext | Where-Object { $_.Name -eq $environmentName -and  $_.type -eq "Sandbox" }) {
        Remove-BcEnvironment -bcAuthContext $authContext -environment $environmentName
    }
}

if ("$AgentName" -ne "Hosted Agent" -and "$AgentName" -notlike "Azure Pipelines*") {
    $cleanupMutexName = "Cleanup"
    $cleanupMutex = New-Object System.Threading.Mutex($false, $cleanupMutexName)
    try {
        try {
            if (!$cleanupMutex.WaitOne(1000)) {
                Write-Host "Waiting for other process to finish cleanup"
                $cleanupMutex.WaitOne() | Out-Null
                Write-Host "Other process completed"
            }
        }
        catch [System.Threading.AbandonedMutexException] {
           Write-Host "Other process terminated abnormally"
        }
    
        Remove-BcContainer -containerName $containerName
        Flush-ContainerHelperCache -KeepDays 2
        
        Remove-Module BcContainerHelper
        $path = Join-Path $ENV:Temp $containerName
        if (Test-Path $path) {
            Remove-Item $path -Recurse -Force
        }
    }
    finally {
        $cleanupMutex.ReleaseMutex()
    }
}
