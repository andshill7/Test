
$x = Get-Content -Path c:\temp\dcs.txt 

 foreach ($DC in $x)

 {

$colItems = get-wmiobject -class "Win32_ComputerSystem" -namespace "root\CIMV2" -computername $DC

foreach ($objItem in $colItems){
$displayGB = [math]::round($objItem.TotalPhysicalMemory/1024/1024/1024, 0)
write-host "Total Physical Memory: " $displayGB "GB"
write-host "Model: " $objItem.Model
}

$colItems = get-wmiobject -class "Win32_Processor" -namespace "root\CIMV2" -computername $DC
foreach ($objItem in $colItems){
write-host "System Name: " $objItem.SystemName


}

}