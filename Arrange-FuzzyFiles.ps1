<#
    For use in the 'filedir' folder of a moodle installation, in case the separation of the files in 2 subfolders is lost.
    This script assumes the first separation is intact.
    
    More on Moodle's File API: https://docs.moodle.org/dev/File_API_internals#File_storage_on_disk
#>

$startingLocation = Get-Location

Get-ChildItem -Directory | ForEach-Object -Process {
    Set-Location $_.FullName

    # For each file in the current folder, create a folder named after the 3rd and 4th letters of the filename and move the file there
    Get-ChildItem -File -Recurse | ForEach-Object -Process {$folderName = $_.Name.ToString().Substring(2,2) ; New-Item -Name $folderName -ItemType Directory -ErrorAction SilentlyContinue}
    Get-ChildItem -File -Recurse | ForEach-Object -Process {Move-Item -Path $_.FullName -Destination ($_.Name.ToString().Substring(2,2) + "\" )}
}
Set-Location $startingLocation