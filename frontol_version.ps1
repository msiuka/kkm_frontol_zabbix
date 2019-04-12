$pathx86 = 'c:\Program Files (x86)\ATOL\Frontol5\Bin\Frontol.exe'
$path = 'c:\Program Files\ATOL\Frontol5\Bin\Frontol.exe'
if(Test-Path -Path $pathx86)
{
	(Get-Command $pathx86).FileVersionInfo.ProductVersion
}
if(Test-Path -Path $path)
{
	(Get-Command $path).FileVersionInfo.ProductVersion
}