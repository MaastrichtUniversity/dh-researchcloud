[String]$WebDAVShare = '\\download.datahubmaastricht.nl'
$username = "[System.Environment]::GetEnvironmentVariable('Username')"
$token = "[System.Environment]::GetEnvironmentVariable('Token')"
New-PSDrive -Name S -PSProvider FileSystem -Root $WebDAVShare -Credential $username, $token