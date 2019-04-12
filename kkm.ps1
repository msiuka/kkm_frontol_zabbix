foreach($linepath in Get-Content D:\Zabbix\ofdstatepaths.txt)
{
	if(Test-Path -Path $linepath)
	{
		foreach($line in Get-Content $linepath)
		{
			if ($args[0] -eq "KKMModel")
			{
				if($line -match "KKMModel=(.+)"){
					$parsed = [Regex]::Matches($line,"KKMModel=(.+)")
					$model = $parsed[0].Groups[1].Value
					if ($model -eq "¿“ŒÀ FPrint-22œ“ ")
					{
						write-output "ATOL FPrint-22PTK"
					}
					else
					{
						write-output $model
					}
				}
			}
			if ($args[0] -eq "KKMSerial")
			{
				if($line -match "SerialNmber=(.+)"){
					$parsed = [Regex]::Matches($line,"SerialNmber=(.+)")
					write-output $parsed[0].Groups[1].Value
				}
			}
			if ($args[0] -eq "FNExpDate")
			{
				if($line -match "FNExpDate=(.+)"){
					$parsed = [Regex]::Matches($line,"FNExpDate=(.+)")
					$CurrentDate = Get-Date
					$date = Get-Date -Date $parsed[0].Groups[1].Value
					$unixtime = [math]::Round((New-TimeSpan -Start $CurrentDate -End $date).TotalDays)
					write-output $unixtime
				}
			}
			if ($args[0] -eq "DocsCount")
			{
				if($line -match "DocsCount=(.+)"){
					$parsed = [Regex]::Matches($line,"DocsCount=(.+)")
					write-output $parsed[0].Groups[1].Value
				}
			}
			if ($args[0] -eq "BufferAge")
			{
				if($line -match "FNBufferAge=(.+)"){
					$parsed = [Regex]::Matches($line,"FNBufferAge=(.+)")
					if ($parsed[0].Groups[1].Value -eq "30.12.1899")
					{
						write-output 0
					}
					else
					{
						$CurrentDate = Get-Date
						$date = Get-Date -Date $parsed[0].Groups[1].Value
						$unixtime = [math]::Round((New-TimeSpan -Start $date -End $CurrentDate).TotalHours)
						write-output $unixtime
					}
				}
			}
		}
		
		break
	}
}