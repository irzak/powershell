# This program search for pcap file(s) in GNS3 project folder.
# User can see the pcap file(s) found and can choose to delete or not.

$programDir = "\GNS3\projects\*\project-files\captures\*.pcap"
$dir = $HOME + $programDir

$pcapFiles = Get-ChildItem $dir     # Get pcap files as array of objects.
$pcapFilesCount = $pcapFiles.Count  # Store the number of pcap file(s) found in GNS3 project dir.

# Run if there is at least 1 pcap file in GNS3 project folder.
if ($pcapFilesCount -gt 1) {

    Write-Host "Found $pcapFilesCount pcap file(s) in program directory"
    Write-Host "Please confirm to delete below file(s)"

    Write-Host "======================================="
    Write-Host $pcapFiles[0].DirectoryName "`n"
    $pcapFiles.Name
    Write-Host "=======================================`n"

    # Get user answer and change to lower case characters.
    $answer = Read-Host -Prompt "Confirm [yes/no]"
    $answer = $answer.ToLower()


    if (($answer.Length -eq 3) -and ($answer.Equals("yes"))) {

        Remove-Item $pcapFiles
        Write-Host "Successfully deleting file(s)"
        
    } elseif (($answer.Length -eq 2) -and ($answer.Equals("no"))) {

        Write-Host "File(s) not deleted"
        
    } elseif (($answer.Length -eq 1) -and ($answer.Equals("y"))) {

        Remove-Item $pcapFiles
        Write-Host "Successfully deleting file(s)"
        
    } elseif (($answer.Length -eq 1) -and ($answer.Equals("n"))) {

        Write-Host "File(s) not deleted"
    
    } else {

        Write-Host "Please enter a valid input. Ex yes/y/no/n"
        Exit
    }

} else {
    Write-Host "No pcap file found in GNS3 project folder."
}
