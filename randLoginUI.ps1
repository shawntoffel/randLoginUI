Param (
[Parameter(Mandatory=$True)]
[ValidateNotNull()]
$Pictures
)

Function GetRandomPicture($pictureDir) {
	# allowed image file types
	$fileTypes = @('*.jpg','*.jpeg', '*.png')
	
	# get full name of files
	$pictures = Get-ChildItem $Pictures -Recurse -Include $fileTypes | % {$_.FullName}
	
	# return 1 random file path
	return $pictures | random -c 1
}

Function CopyRandomPicture($pictureDir) {
	# directory for an OEM loginUI
	$loginBackgroundDir = "C:\Windows\System32\oobe\info\backgrounds\"
	
	# Windows needs a jpg with this name
	$loginFilename = "backgroundDefault.jpg"
	
	# ensure directory exists
	New-Item -Force $loginBackgroundDir -Type Directory
	
	# get a random picture
	$picture = GetRandomPicture($pictureDir)
	
	# copy the picture to the directory with the required name
	Copy-Item -Recurse -Force $picture ($loginBackgroundDir + $loginFilename)
}

Function SetRegestryProperty {
	# location in registry
	$path = 'hklm:software\microsoft\windows\currentversion\Authentication\LogonUI\Background'
	$name = "OEMBackground"
	
	# determine if the property is null
	$OEMBackground = (Get-ItemProperty -Path $path).$name -eq $null

	# Set to 1 if exists. Create if doesn't exist.
	If ($OEMBackground -eq $False)  {
		Set-ItemProperty -Path $path -Name $name -Value 1	
	}
	else {
		New-ItemProperty $path -Name $name -Value 1 -PropertyType "DWord"
	}
}

# Ensure the loginUI OEMBackground property is enabled in registry.
SetRegestryProperty

# Overwrite random picture to loginUI OEMBackground directory
CopyRandomPicture($Pictures)