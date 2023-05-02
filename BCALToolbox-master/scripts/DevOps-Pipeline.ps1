Param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('AzureDevOps','GithubActions','GitLab')]
    [string] $environment = 'AzureDevOps',
    [Parameter(Mandatory=$true)]
    [string] $version,
    [Parameter(Mandatory=$false)]
    [int] $appBuild = 0,
    [Parameter(Mandatory=$false)]
    [int] $appRevision = 0
)

if ($environment -eq "AzureDevOps") {
    $buildArtifactFolder = $ENV:BUILD_ARTIFACTSTAGINGDIRECTORY
}
elseif ($environment -eq "GitHubActions") {
    $buildArtifactFolder = Join-Path $ENV:GITHUB_WORKSPACE "output"
    New-Item $buildArtifactFolder -ItemType Directory | Out-Null
}

$baseFolder = (Get-Item (Join-Path $PSScriptRoot "..")).FullName
. (Join-Path $PSScriptRoot "Read-Settings.ps1") -environment $environment -version $version
. (Join-Path $PSScriptRoot "Install-BcContainerHelper.ps1") -bcContainerHelperVersion $bcContainerHelperVersion -genericImageName $genericImageName

$authContext = $null
$refreshToken = "$($ENV:BcSaasRefreshToken)"
$environmentName = "$($ENV:EnvironmentName)"
if ($refreshToken -and $environmentName) {
    $authContext = New-BcAuthContext -refreshToken $refreshToken
    if (Get-BcEnvironments -bcAuthContext $authContext | Where-Object { $_.Name -eq $environmentName -and  $_.type -eq "Sandbox" }) {
        Remove-BcEnvironment -bcAuthContext $authContext -environment $environmentName
    }
    $countryCode = $artifact.Split('/')[3]
    New-BcEnvironment -bcAuthContext $authContext -environment $environmentName -countryCode $countrycode -environmentType "Sandbox" | Out-Null
    do {
        Start-Sleep -Seconds 10
        $baseApp = Get-BcPublishedApps -bcAuthContext $authContext -environment $environmentName | Where-Object { $_.Name -eq "Base Application" }
    } while (!($baseApp))
    $baseapp | Out-Host

    $artifact = Get-BCArtifactUrl `
        -country $countryCode `
        -version $baseApp.Version `
        -select Closest
    
    if ($artifact) {
        Write-Host "Using Artifacts: $artifact"
    }
    else {
        throw "No artifacts available"
    }
}

$params = @{}
$insiderSasToken = "$ENV:insiderSasToken"
$licenseFile = "$ENV:licenseFile"
$codeSigncertPfxFile = "$ENV:CodeSignCertPfxFile"
if (!$doNotSignApps -and $codeSigncertPfxFile) {
    if ("$ENV:CodeSignCertPfxPassword" -ne "") {
        $codeSignCertPfxPassword = try { "$ENV:CodeSignCertPfxPassword" | ConvertTo-SecureString } catch { ConvertTo-SecureString -String "$ENV:CodeSignCertPfxPassword" -AsPlainText -Force }
        $params = @{
            "codeSignCertPfxFile" = $codeSignCertPfxFile
            "codeSignCertPfxPassword" = $codeSignCertPfxPassword
        }
    }
    else {
        $codeSignCertPfxPassword = $null
    }
}

$allTestResults = "testresults*.xml"
$testResultsFile = Join-Path $baseFolder "TestResults.xml"
$testResultsFiles = Join-Path $baseFolder $allTestResults
if (Test-Path $testResultsFiles) {
    Remove-Item $testResultsFiles -Force
}

Run-AlPipeline @params `
    -pipelinename $pipelineName `
    -containerName $containerName `
    -imageName $imageName `
    -bcAuthContext $authContext `
    -environment $environmentName `
    -artifact $artifact.replace('{INSIDERSASTOKEN}',$insiderSasToken) `
    -memoryLimit $memoryLimit `
    -baseFolder $baseFolder `
    -licenseFile $LicenseFile `
    -installApps $installApps `
    -previousApps $previousApps `
    -appFolders $appFolders `
    -testFolders $testFolders `
    -doNotRunTests:$doNotRunTests `
    -testResultsFile $testResultsFile `
    -testResultsFormat 'JUnit' `
    -installTestRunner:$installTestRunner `
    -installTestFramework:$installTestFramework `
    -installTestLibraries:$installTestLibraries `
    -installPerformanceToolkit:$installPerformanceToolkit `
    -enableCodeCop:$enableCodeCop `
    -enableAppSourceCop:$enableAppSourceCop `
    -enablePerTenantExtensionCop:$enablePerTenantExtensionCop `
    -enableUICop:$enableUICop `
    -azureDevOps:($environment -eq 'AzureDevOps') `
    -gitLab:($environment -eq 'GitLab') `
    -gitHubActions:($environment -eq 'GitHubActions') `
    -failOn 'error' `
    -AppSourceCopMandatoryAffixes $appSourceCopMandatoryAffixes `
    -AppSourceCopSupportedCountries $appSourceCopSupportedCountries `
    -additionalCountries $additionalCountries `
    -buildArtifactFolder $buildArtifactFolder `
    -CreateRuntimePackages:$CreateRuntimePackages `
    -appBuild $appBuild -appRevision $appRevision

if ($environment -eq 'AzureDevOps') {
    Write-Host "##vso[task.setvariable variable=TestResults]$allTestResults"
}

