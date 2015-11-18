//
//  AppDelegate.swift
//  El Disk Utility
//
//  Created by Corey Stewart on 11/18/15.
//  Copyright © 2015 motoxnate. All rights reserved.
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