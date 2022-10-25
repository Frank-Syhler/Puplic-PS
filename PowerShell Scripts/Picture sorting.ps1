Write-Host "Skriv stigen for biblioteket hvor du vil sortere dine filer"
$Destanation = "c:\Temp" #Mappen hvor billederne bliver overført til
$PathOfFiles = Read-Host
$count = 0
$NoCount = 0

Get-ChildItem "$PathOfFiles\*" -include *.mov, *.mp4, *.gif, *.3gp | foreach {
  $Date = $_.LastWriteTime.ToShortDateString()
  $NewFolderName = Get-Date $Date -Format yyyy
  $DesPathForFolder = "$Destanation\$NewFolderName\MobileVidios"
  $FileName = $_.name

  if(Test-Path "$DesPathForFolder\$FileName")
  {
    Write-Host "$Filename eksistere allerede, og er derfor ikke flyttet"
    $NoCount += 1
  }
  else
  {
    if (test-path $DesPathForFolder)
    { 
      move-item $_.fullname $DesPathForFolder 
    }
    else
    {
      new-item -ItemType directory -Path $DesPathForFolder
      move-item $_.fullname $DesPathForFolder
    }
    $count += 1
  }
}

Get-ChildItem "$PathOfFiles\*" -include *.png | foreach {
  $Date = $_.LastWriteTime.ToShortDateString()
  $NewFolderName = Get-Date $Date -Format yyyy
  $DesPathForFolder = "$Destanation\$NewFolderName\Screenshots"
  $FileName = $_.name

  if(Test-Path "$DesPathForFolder\$FileName")
  {    
    Write-Host "$Filename eksistere allerede, og er derfor ikke flyttet"
    $NoCount += 1
  }
  else
  {    
    if (test-path $DesPathForFolder)
    { 
      move-item $_.fullname $DesPathForFolder 
    }
    else
    {
      new-item -ItemType directory -Path $DesPathForFolder
      move-item $_.fullname $DesPathForFolder
    }
    $count += 1
  }
}

Get-ChildItem "$PathOfFiles\*" -include *.jpg, *.jpeg | foreach {
  $Date = $_.LastWriteTime.ToShortDateString()
  $NewFolderName = Get-Date $Date -Format yyyy
  $DesPathForFolder = "$Destanation\$NewFolderName"
  $FileName = $_.name

  if(Test-Path "$DesPathForFolder\$FileName")
  {    
    Write-Host "$Filename eksistere allerede, og er derfor ikke flyttet"
    $NoCount += 1
  }
  else
  {
    if (test-path $DesPathForFolder)
    { 
      move-item $_.fullname $DesPathForFolder 
    }
    else
    {
      new-item -ItemType directory -Path $DesPathForFolder
      move-item $_.fullname $DesPathForFolder
    }
    $count += 1
  }
}
Write-Host "Antal filer kopieret      : $count"
Write-host "Antal filer ikke kopieret : $NoCount"
Read-Host