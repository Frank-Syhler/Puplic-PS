#Move pictures from this folder
$FromPath = "D:\Billeder\Nye billeder til sortering"
#Target folder to place files
$ToPath = "C:\Temp\New folder"
$FileType = "*.jpeg"

#function Sort-Files ($FromPath, $ToPath, $FileType){
    $AllFiles = Get-ChildItem "$FromPath\*" -Include $FileType -Recurse 
    $AllFiles | foreach {
        $FullDate = $_.LastWriteTime
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
                Write-Output "Kopiere filen $FileName"
                Copy-Item $_.fullname $DesPathForFolder 
            }
            else
            {
                Write-Output "Orpetter mappe $DesPathForFolder"
                New-Item -ItemType directory -Path $DesPathForFolder
                Write-Output "Kopiere filen $FileName"
                Copy-Item $_.fullname $DesPathForFolder
            }
        }
    }
#}

Sort-Files -FromPath $TargetFolder -ToPath $SortedFolder -FileType "*.jpeg"
Sort-Files -FromPath $TargetFolder -ToPath $SortedFolder -FileType "*.jpg"
Sort-Files -FromPath $TargetFolder -ToPath $SortedFolder -FileType "*.png"

#-------------------------------------------------------------------------------
$Test = Get-ChildItem "C:\Temp\New folder\2022\11\IMG_7116.JPEG"
$FullDate = $Test.LastWriteTime
$YearDate = Get-Date $FullDate -Format yyyy
$MonthDate = Get-Date $FullDate -Format MM
Get-Item -Path "$TargetFolder\IMG_1481.jpg" | Get-Member


$AllFiles.LastWriteTime
$AllFiles.CreationTime



try
{
    $path = "C:\Temp\IMG_0116.JPEG"
    $pathModified = "C:\Temp\IMG_0116_MODIFIED.JPEG"

    Add-Type -AssemblyName System.Drawing
    $bitmap = New-Object System.Drawing.Bitmap($path)
    $propertyItem = $bitmap.GetPropertyItem(36867) 
    $bytes = $propertyItem.Value 
    $string = [System.Text.Encoding]::ASCII.GetString($bytes) 
    $dateTime = [DateTime]::ParseExact($string,"yyyy:MM:dd HH:mm:ss`0",$Null)
   
    $dateTimeModified = $dateTime.AddDays(1) # Set new date here
    $stringModified = $dateTimeModified.ToString("yyyy:MM:dd HH:mm:ss`0",$Null)
    $bytesModified = [System.Text.Encoding]::ASCII.GetBytes($stringModified) 

    $propertyItem.Value = $bytesModified
    $bitmap.SetPropertyItem($propertyItem)
    $bitmap.Save($pathModified)
}
finally
{
    $bitmap.Dispose()
}

$Test = Get-ChildItem $pathModified

$Test.LastWriteTime
$Test.CreationTime