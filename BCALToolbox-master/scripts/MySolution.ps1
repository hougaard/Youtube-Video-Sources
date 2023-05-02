$path = Join-Path $PSScriptRoot ".."

$replaceObjectIds = @{
    "50130" = 80130
    "50133" = 80133
    "50101" = 80101
    "50100" = 80100
    "50149" = 80149
}
$replaceValues = @{
    "00000000-0000-0000-0000-000000000001" = [Guid]::NewGuid().ToString()
    "00000000-0000-0000-0000-000000000002" = [Guid]::NewGuid().ToString()
    "00000000-0000-0000-0000-000000000003" = [Guid]::NewGuid().ToString()
    "HelloWorld" = "MyApp"
    "Default Publisher" = "My Name"
    "Default App Name" = "My App"
    "Default Base App Name" = "My Base App"
    "Default Test App Name" = "My Test App"
    "2.0.0.0" = "1.0.0.0"
    "https://businesscentralapps.azureedge.net/githubhelloworld/latest/apps.zip" = ""
} + $replaceObjectIds

function ReplaceProperty { Param ($object, $property)
    if ($object.PSObject.Properties.name -eq $property) {
        $str = "$($object."$property")"
        if ($replaceValues.ContainsKey($str)) {
            Write-Host "- change $property from $str to $($replaceValues[$str]) "
            $object."$property" = $replaceValues[$str]
        }
    }
}

function ReplaceObject { Param($object)
    "id", "appId", "name", "publisher", "version", "previousApps", "appSourceCopMandatoryAffixes", "appSourceCopSupportedCountries","from","to" | ForEach-Object {
        ReplaceProperty -object $object -property $_
    }
}

Get-ChildItem -Path $path | Where-Object { $_.psIsContainer -and $_.Name -notlike ".*" } | Get-ChildItem -Recurse -filter "app.json" | ForEach-Object {
    $appJsonFile = $_.FullName
    $appJson = Get-Content $appJsonFile | ConvertFrom-Json
    Write-Host -ForegroundColor Yellow $appJsonFile
    ReplaceObject -object $appJson
    Write-Host "Check idRanges"
    $appJson.idRanges | ForEach-Object { ReplaceObject($_) }
    Write-Host "Check Dependencies"
    $appJson.dependencies | ForEach-Object { ReplaceObject($_) }
    $appJson | ConvertTo-Json -Depth 10 | Set-Content $appJsonFile
}

Get-ChildItem -Path $path | Where-Object { $_.psIsContainer -and $_.Name -notlike ".*" } | Get-ChildItem -Recurse -filter "*.al" | ForEach-Object {
    $source = Get-Content $_.FullName
    $replaceObjectIds.Keys | % {
        $source = $source.Replace("$_", $replaceObjectIds."$_")
    }
    Set-Content -Path $_.FullName -Value $source
}


$settingsFile = Join-Path $PSScriptRoot "settings.json"
$settings = Get-Content $settingsFile | ConvertFrom-Json
Write-Host -ForegroundColor Yellow $settingsFile
ReplaceObject -object $settings
$settings | ConvertTo-Json -Depth 10 | Set-Content $settingsFile
