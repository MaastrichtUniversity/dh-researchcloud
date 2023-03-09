
$LOGFILE = "c:\logs\plugin-cyberduck-install.log"

Function Write-Log([String] $logText) {
  '{0:u}: {1}' -f (Get-Date), $logText | Out-File $LOGFILE -Append
}

Function Main {

  Write-Log "Start plugin-cyberduck-install"
 
  try {

    choco feature enable -n allowGlobalConfirmation
    #install anaconda
    If(Test-Path -Path "$env:ProgramData\Chocolatey") {
      choco install cyberduck  --no-progress
    }
    Else {
      Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
      choco install cyberduck  --no-progress
    }
  }
  catch {
      Write-Log "$_"
      Throw $_
  }
  
  Write-Log "End plugin-cyberduck-install"
 
}

Main
