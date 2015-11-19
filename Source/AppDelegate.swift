//
//  AppDelegate.swift
//  El Disk Utility
//
//  Copyright © 2015 motoxnate.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

/*

When you need to localize in the code, use this function.

Usage:
	"[string key]".localized

This returns the value of [string key] defined in Localizable.strings.

Example:
	myLabel.text = "Hi".localized

*/

extension String {
	var localized: String {
		return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
	}
}

/*

Example:

Strings File:
>	//Localizable.strings:
>
>	/* with !!! */
>	"Hi" = "Привет!!!";

Usage:
	myLabel.text = "Hi".localizedWithComment("with !!!")

*/

extension String {
	func localizedWithComment(comment:String) -> String {
		return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: comment)
	}
}


// Below are some unfinished functions that needed

func mountPartition(path:String) throws {
	
	if false {
		// If partition is already mounted
		throw MountError.AlreadyMounted
	}
	
	if false {
		// If partition has invalid filesystem
		throw MountError.NoMountableFilesystems
	}
}

func unmountPartition(path:String) throws {
	
	if false {
		// if partition is being used
		throw MountError.ResourceBusy
	}
}

func driveIsSSD(path:String) -> Bool {
	/*
		SSD drives must be handled differently using the Secure Erase feature. Therefore, it is nessesary to detect whether a drive is SSD or something else. The function should return true if the given drive is Solid-State.
	*/
	return false
}

func driveIsStartup(path:String) -> Bool {
	/*
		Returns true if the given drive is the startup volume.
	*/
	return false
}

func partitionIsSystem(path:String) -> Bool {
	/*
		This is needed in order to protect the system being used to run this app.
		Returns true if the given partition is the system volume.
	*/
	return false
}


