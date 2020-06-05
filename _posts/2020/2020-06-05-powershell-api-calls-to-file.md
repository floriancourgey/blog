---
title: Powershell API calls and save to file
categories: [powershell,opensource]
---

Powershell script for API call (REST), Exception catching, foreach loop and write to file

<p class="text-center">📂↔️🌍</p>

<!--more-->

## Basic Rest API GET Call

Call [httpbin.org/json](https://httpbin.org/json) and fetch basic data in PowerShell:

![todo](/assets/images/2020/powershell-api-call-basic-save-file.jpg)

```powershell
# env dependant
$baseUrl = "https://httpbin.org"
# constants
$finalUrl = $baseUrl + "/json"
$response = Invoke-RestMethod $finalUrl -Method 'GET' -UseDefaultCredentials # UseDefaultCredentials for default proxy
Write-Output $response.slideshow
```

## Advanced Rest API GET Call
Let's add Header Key based auth, exception management and save to file with PowerShell:

![todo](/assets/images/2020/powershell-api-call-save-file.jpg)

```powershell
# environment dependant settings
$apiKey = "xxxx"
$baseUrl = "https://httpbin.org"
# imports
Add-Type -AssemblyName System.Web # for URL decode
# constants
$startTime = Get-Date
$folder = '.\'
$finalUrl = $baseUrl + "/json"
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Ocp-Apim-Subscription-Key", $apiKey)
$headers.Add("Content-Type", "application/json")

Try {
	$response = Invoke-RestMethod $finalUrl -Method 'GET' -UseDefaultCredentials -Headers $headers
} Catch [System.Net.WebException]{
	# API returns 404 if not found, that's OK, it's not an error
	if($_.Exception.Response -And $_.Exception.Response.StatusCode -And $_.Exception.Response.StatusCode.value__.equals(404)){
		Write-Output "Not found"
		Exit 0
	}
	# any code different from 404 is an error
	else {
		Write-Output "Exception for API call:"
		Write-Output ($_ | Out-String)
		Exit -999
	}
}

$i = 0
foreach ($slide in $response.slideshow.slides){
	if(-Not $slide.items) {continue}
	foreach ($item in $slide.items){
		$filename = $startTime.ToString("yyyyMMddHHmmss_") + ($i++) + "_item.xml" # 20200515160425_2_item.xml
		[IO.File]::WriteAllText($folder + $filename, $item)
		Write-Output "Saved to $($folder + $filename)"
	}
}
```

## Call PowerShell from Batch file

PowerShell might be disabled because of Computer Policy

```console
PS C:\ > script.ps1
script.ps1 cannot be loaded
because running scripts is disabled on this system. For more information, see about_Execution_Policies at
https:/go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:1
```

Create a `.bat` file to start the PowerShell script with `powershell.exe -NoLogo -ExecutionPolicy Bypass -Command script.ps1`:
```console
C:\ > %SystemRoot%\syswow64\WindowsPowerShell\v1.0\powershell.exe -NoLogo -ExecutionPolicy Bypass -Command script.ps1
[...]
```
