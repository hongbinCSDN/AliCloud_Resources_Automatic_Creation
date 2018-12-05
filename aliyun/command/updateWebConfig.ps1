$connectionString = $args[0]
$dbName = $args[1]

$webConfig = 'C:\inetpub\wwwroot\PSMS\Web.config'

$doc = (Get-Content $webConfig) -as [Xml]


$myConString = $doc.configuration.appSettings.add | ? {$_.key -eq 'PSMS.ConnectionString'}
$newCon = $myConString.value.Replace('[[RDSInstance]]',$connectionString)
$newCon = $newCon.Replace('[[DBName]]',$dbName)
$myConString.value = $newCon
$doc.Save($webConfig)



$webConfig = 'C:\inetpub\wwwroot\PSMS.Interop\Web.config'

$doc = (Get-Content $webConfig) -as [Xml]


$myConString = $doc.configuration.appSettings.add | ? {$_.key -eq 'PSMS.ConnectionString'}
$newCon = $myConString.value.Replace('[[RDSInstance]]',$connectionString)
$newCon = $newCon.Replace('[[DBName]]',$dbName)
$myConString.value = $newCon
$doc.Save($webConfig)
