Param(
    [Parameter(Mandatory=$false)]
    [string] $version = "ci"
)

$baseFolder = (Get-Item (Join-Path $PSScriptRoot "..")).FullName
. (Join-Path $PSScriptRoot "Read-Settings.ps1") -environment 'Local' -version $version
. (Join-Path $PSScriptRoot "Install-BcContainerHelper.ps1") -bcContainerHelperVersion $bcContainerHelperVersion -genericImageName $genericImageName

if (("$vaultNameForLocal" -eq "") -or !(Get-AzKeyVault -VaultName $vaultNameForLocal)) {
    throw "You need to setup a Key Vault for use with local pipelines"
}
Get-AzKeyVaultSecret -VaultName $vaultNameForLocal | ForEach-Object {
    Write-Host "Get Secret $($_.Name)Secret"
    Set-Variable -Name "$($_.Name)Secret" -Value (Get-AzKeyVaultSecret -VaultName $vaultNameForLocal -Name $_.Name -WarningAction SilentlyContinue)
}
$licenseFile = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($licenseFileSecret.SecretValue))
$insiderSasToken = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($insiderSasTokenSecret.SecretValue))
$credential = New-Object pscredential 'admin', $passwordSecret.SecretValue

$allTestResults = "testresults*.xml"
$testResultsFile = Join-Path $baseFolder "TestResults.xml"
$testResultsFiles = Join-Path $baseFolder $allTestResults
if (Test-Path $testResultsFiles) {
    Remove-Item $testResultsFiles -Force
}

Run-AlPipeline `
    -pipelineName $pipelineName `
    -containerName $containerName `
    -imageName $imageName `
    -artifact $artifact.replace('{INSIDERSASTOKEN}',$insiderSasToken) `
    -memoryLimit $memoryLimit `
    -baseFolder $baseFolder `
    -licenseFile $licenseFile `
    -installApps $installApps `
    -appFolders $appFolders `
    -testFolders $testFolders `
    -testResultsFile $testResultsFile `
    -testResultsFormat 'JUnit' `
    -installTestRunner:$installTestRunner `
    -installTestFramework:$installTestFramework `
    -installTestLibraries:$installTestLibraries `
    -installPerformanceToolkit:$installPerformanceToolkit `
    -credential $credential `
    -doNotRunTests `
    -useDevEndpoint `
    -updateLaunchJson "Local Sandbox" `
    -keepContainer
