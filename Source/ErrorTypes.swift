//
//  ErrorTypes.swift
//  El Disk Utility
//
//  Copyright © 2015 motoxnate.
//

import Foundation

// Errors associated with mounting

enum MountError: ErrorType {
	case AlreadyMounted
	case NoMountableFilesystems
	case ResourceBusy
}