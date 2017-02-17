Get-WmiObject -Namespace 'root\webadministration' -Class ApplicationPool -ComputerName computernamehere ` -Authentication 6 -Filter "Name='serverA'" | Invoke-WmiMethod -Name Stop

$appPoolName = "serverA"
$appPoolStatus = Invoke-Command -ComputerName computernamehere { param($apn) Import-Module WebAdministration; (Get-WebAppPoolState $apn).Value;} -Args $appPoolName
add-content -path C:\test\logs\test.txt -value "serverA app pool is $appPoolStatus"

echo $appPoolStatus

Get-WmiObject -Namespace 'root\webadministration' -Class ApplicationPool -ComputerName computernamehere ` -Authentication 6 -Filter "Name='serverA'" | Invoke-WmiMethod -Name Start

$appPoolStatus = Invoke-Command -ComputerName computernamehere { param($apn) Import-Module WebAdministration; (Get-WebAppPoolState $apn).Value;} -Args $appPoolName
add-content -path C:\test\logs\test.txt -value "serverA app pool is $appPoolStatus"

echo $appPoolStatus



test
