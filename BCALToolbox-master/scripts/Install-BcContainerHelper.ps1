Param(
    [string] $bcContainerHelperVersion = "",
    [string] $genericImageName = ""
)

if ($bcContainerHelperVersion -eq "") { $bcContainerHelperVersion = "latest" }
if ($bccontainerHelperVersion -eq "dev") { $bccontainerHelperVersion = "https://github.com/microsoft/navcontainerhelper/archive/dev.zip" }

if ($bccontainerHelperVersion -like "https://*") {
    $path = Join-Path $env:TEMP ([Guid]::NewGuid().ToString())
}
else {
    $bcbaseurl = "https://bccontainerhelper.azureedge.net/public"
    $versionsxml = [xml](New-Object System.Net.WebClient).DownloadString("$($bcbaseurl)?comp=list&restype=container")

    $latestVersion = $versionsxml.EnumerationResults.ChildNodes.Blob.Name | Where-Object { $_ -ne "latest.zip" -and $_ -notlike "*preview*" } | ForEach-Object { $_.replace('.zip','') } | Sort-Object { [Version]$_ } | Select-Object -Last 1
    $previewVersion = $versionsxml.EnumerationResults.ChildNodes.Blob.Name | Where-Object { $_ -like "*-preview*" } | ForEach-Object { $_.replace('.zip','') } | Sort-Object { [Version]($_.replace('-preview','.')) } | Select-Object -Last 1
    if ([version]$latestVersion -ge [version]($previewVersion.split('-')[0])) {
        $previewVersion = $latestVersion
    }
    
    if ($bccontainerHelperVersion -eq "latest") {
        $bccontainerHelperVersion = $latestVersion
    }
    elseif ($bccontainerHelperVersion -eq "preview") {
        $bccontainerHelperVersion = $previewVersion
    }
    $basePath = Join-Path $env:ProgramFiles "WindowsPowerShell\Modules\BcContainerHelper"
    if (!(Test-Path $basePath)) { New-Item $basePath -ItemType Directory | Out-Null }
    $path = Join-Path $basePath $bccontainerHelperVersion
    $bccontainerHelperVersion = "$bcbaseurl/$bccontainerHelperVersion.zip"
}

$bchMutexName = "bcContainerHelper"
$bchMutex = New-Object System.Threading.Mutex($false, $bchMutexName)
try {
    try { $bchMutex.WaitOne() | Out-Null } catch {}
    if (!(Test-Path $path)) {
        $tempName = Join-Path $env:TEMP ([Guid]::NewGuid().ToString())
        Write-Host "Downloading $bccontainerHelperVersion"
        (New-Object System.Net.WebClient).DownloadFile($bccontainerHelperVersion, "$tempName.zip")
        Expand-Archive -Path "$tempName.zip" -DestinationPath $tempName
        $folder = (Get-Item -Path (Join-Path $tempName '*')).FullName
        [System.IO.Directory]::Move($folder,$path)
    }
}
finally {
    $bchMutex.ReleaseMutex()
}
. (Join-Path $path "BcContainerHelper.ps1")

if ($genericImageName) {
    $bcContainerHelperConfig.genericImageName = $genericImageName
}
