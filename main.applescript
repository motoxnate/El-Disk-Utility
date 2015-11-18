tell application "Finder" to set diskList to the name of every disk whose local volume is true and startup is false
set activityList to {"Secure Erase", "Verify", "Repair", "Mount", "Unmount"}

to getWhole(diskChoice)
	set driveName to diskChoice
	set wholeCheck to "diskutil info \"" & (driveName as text) & "\" | grep Whole | grep -v \"Part of\" | awk '{print $2}'"
	set getWhole to do shell script wholeCheck as text
end getWhole

to getDiskID(diskChoice)
	set driveName to diskChoice
	set getDriveIdentifier to "diskutil info \"" & (driveName as text) & "\" | grep Ident | awk '{print $3}'"
	set driveIdentifier to do shell script getDriveIdentifier as text
	set diskID to characters 1 thru 5 of driveIdentifier as text
end getDiskID

to getPartitionID(diskChoice)
	set driveName to diskChoice
	set getDriveIdentifier to "diskutil info \"" & (driveName as text) & "\" | grep Ident | awk '{print $3}'"
	set partitionID to do shell script getDriveIdentifier as text
end getPartitionID


choose from list activityList with title "Disk Utility" with prompt "Choose an Action:"
if the result is not false then
	set activity to the result

	if activity contains "Secure Erase" then
		choose from list diskList with title activity with prompt "Choose which disk to " & activity & ":"
		if the result is not false then
			set diskChoice to the result as text
			set whole to getWhole(diskChoice)
			if whole contains "No" then
				display dialog diskChoice & " is part of a whole. Do you want to " & activity & " the entire Disk, or the selected partition?" buttons {"Cancel", "Disk", "Partition"} default button 3
				if the result is not false then
					set userChoice to the button returned of the result
					if userChoice contains "Disk" then
						set diskID to getDiskID(diskChoice)
						set erase to "diskutil secureErase 2 " & diskID
						tell application "Terminal"
							do script erase
						end tell
					else if userChoice contains "Partition" then
						set diskID to getPartitionID(diskChoice)
						set erase to "diskutil secureErase freespace 2 " & diskID
						tell application "Terminal"
							do script erase
						end tell
					end if
				end if
			else
				set diskID to getDiskID(diskChoice)
				set erase to "diskutil secureErase 2 " & diskID
				tell application "Terminal"
					do script erase
				end tell
			end if
		end if
	else if activity contains "Verify" then
		choose from list diskList with title activity with prompt "Choose which disk to " & activity & ":"
		if the result is not false then
			set diskChoice to the result as text
			set whole to getWhole(diskChoice)
			if whole contains "No" then
				display dialog diskChoice & " is part of a whole. Do you want to " & activity & " the entire Disk, or the selected partition?" buttons {"Cancel", "Disk", "Partition"} default button 3
				if the result is not false then
					set userChoice to the button returned of the result
					if userChoice contains "Disk" then
						set diskID to getDiskID(diskChoice)
						set verify to "diskutil verifyDisk " & diskID
						tell application "Terminal"
							do script verify
						end tell
					else if userChoice contains "Partition" then
						set diskID to getPartitionID(diskChoice)
						set verify to "diskutil verifyVolume " & diskID
						tell application "Terminal"
							do script verify
						end tell
					end if
				end if
			else
				set diskID to getDiskID(diskChoice)
				set verify to "diskutil verifyDisk " & diskID
				tell application "Terminal"
					do script verify
				end tell
			end if
		end if

	else if activity contains "Repair" then
		choose from list diskList with title activity with prompt "Choose which disk to " & activity & ":"
		if the result is not false then
			set diskChoice to the result as text
			set whole to getWhole(diskChoice)
			if whole contains "No" then
				display dialog diskChoice & " is part of a whole. Do you want to " & activity & " the entire Disk, or the selected partition?" buttons {"Cancel", "Disk", "Partition"} default button 3
				if the result is not false then
					set userChoice to the button returned of the result
					if userChoice contains "Disk" then
						set diskID to getDiskID(diskChoice)
						set repair to "diskutil repairDisk " & diskID
						tell application "Terminal"
							do script repair
						end tell
					else if userChoice contains "Partition" then
						set diskID to getPartitionID(diskChoice)
						set repair to "diskutil repairVolume " & diskID
						tell application "Terminal"
							do script repair
						end tell
					end if
				end if
			else
				set diskID to getDiskID(diskChoice)
				set repair to "diskutil repairDisk " & diskID
				tell application "Terminal"
					do script repair
				end tell
			end if
		end if

	else
		choose from list diskList with title activity with prompt "Choose which disk to " & activity & ":"
		if the result is not false then
			set diskChoice to the result as text
			set whole to getWhole(diskChoice)
			if whole contains "No" then
				display dialog diskChoice & " is part of a whole. Do you want to " & activity & " the entire Disk, or the selected partition?" buttons {"Cancel", "Disk", "Partition"} default button 3
				if the result is not false then
					set userChoice to the button returned of the result
					if userChoice contains "Disk" then
						set diskID to getDiskID(diskChoice)
						set unmount to "diskutil unmountDisk " & diskID
						tell application "Terminal"
							do script unmount
						end tell
					else if userChoice contains "Partition" then
						set diskID to getPartitionID(diskChoice)
						set unmount to "diskutil unmount " & diskID
						tell application "Terminal"
							do script unmount
						end tell
					end if
				end if
			else
				set diskID to getDiskID(diskChoice)
				set unmount to "diskutil unmountDisk " & diskID
				tell application "Terminal"
					do script unmount
				end tell
			end if
		end if
	end if
end if
