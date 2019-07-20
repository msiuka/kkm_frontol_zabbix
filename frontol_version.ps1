$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
foreach($linepath in Get-Content $PSScriptRoot\frontolpaths.txt)
{
	if(Test-Path -Path $linepath)
	{
		(Get-Command $linepath).FileVersionInfo.ProductVersion
		break
	}
}
