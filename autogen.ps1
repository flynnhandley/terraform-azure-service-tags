
$jsonFilePath = "./ServiceTags_Public_20241007.json"

Remove-Item -Path "./autogen_outputs.tf" -ErrorAction SilentlyContinue -Force



$jsonContent = Get-Content -Path $jsonFilePath -Raw | ConvertFrom-Json

$names = $jsonContent.values | ForEach-Object { $_.name }

$names | ForEach-Object { 
    $outputName = $_.Replace(".", "_")
    "output ""${outputName}_ipv6"" { value = local.result[""${_}""].ipv6 }"
    "output ""${outputName}_ipv4"" { value = local.result[""${_}""].ipv4 }"
} | Out-File -FilePath "./autogen_outputs.tf" -Append
    
