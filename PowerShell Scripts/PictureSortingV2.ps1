$TargetFolder = "C:\Users\FrankSyhler\Downloads"
$SortedFolder = "C:\Temp"

function Sort-Files ($FromPath, $ToPath, $FileType){
    Get-ChildItem "$FromPath\*" -Include $FileType -Recurse | foreach {
        $FullDate = $_.CreationTime
        $YearDate = Get-Date $FullDate -Format yyyy
        $MonthDate = Get-Date $FullDate -Format MM
        $DesPathForFolder = "$ToPath\$YearDate\$MonthDate"
        $FileName = $_.name

        if(Test-Path "$DesPathForFolder\$FileName")
        {
            Write-Host "$Filename eksistere allerede, og er derfor ikke flyttet"
        }
        else
        {
            if (test-path $DesPathForFolder)
            { 
                Write-Output "Flytter filen $FileName"
                move-item $_.fullname $DesPathForFolder 
            }
            else
            {
                Write-Output "Orpetter mappe $DesPathForFolder"
                new-item -ItemType directory -Path $DesPathForFolder
                Write-Output "Flytter filen $FileName"
                move-item $_.fullname $DesPathForFolder
            }
        }
    }
}

Sort-Files -FromPath $TargetFolder -ToPath $SortedFolder -FileType "*.jpeg"
Sort-Files -FromPath $TargetFolder -ToPath $SortedFolder -FileType "*.jpg"
Sort-Files -FromPath $TargetFolder -ToPath $SortedFolder -FileType "*.png"

<#-------------------------------------------------------------------------------
$Test = Get-ChildItem "$TargetFolder\*" -Recurse
$FullDate = $Test.CreationTime
$YearDate = Get-Date $FullDate -Format yyyy
$MonthDate = Get-Date $FullDate -Format MM
Get-Item -Path "$TargetFolder\IMG_1481.jpg" | Get-Member
#>
