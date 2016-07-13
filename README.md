# El-Disk-Utility
A simple new disk utility application for Mac OS 10.11 El Capitan users who are annoyed by the nerfed Disk Utility application included with OSX.

I have not yet added the ability to select multiple drives at once, but you can just go through the application a few times if you need to do something like batch secure-erase some drives. I would prefer to keep this as simple as possible.

**Disclaimer**
This application is meant for experienced users who understand how DiskUtility is supposed to work and are at least somewhat familiar with the commandline interface, diskutil. There are NO WARNINGS of any sort before erasing or even secure erasing a drive, so it is entirely up to you to understand that these functions are irriversible and are capable of destroying all of your data in minutes. Just be careful and you won't have any issues!

Thanks for your support!

7/13/16 - UPDATE Version 2.0 Released!

I decided that a simple AppleScript was not sufficient to handle what this app is meant to be used for.
Therefore, I rewrote the whole thing in Java! Please note, this application requires the Java 8 Runtime in order to work properly!
Link to download Java 8 for anyone who needs it - http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
If you do not feel like downloading Java just to run one application, you can download the embedded version of the app, which has Java Embedded and will run as a standalone.

With this new version comes a whole list of new features!

- An actual GUI :D:D:D
- A dropdown menu to select disks. Scrollable if there are too many to show.
- Intuitive buttons that allow easy access to perform actions on the disks.
- A PROGRESS BAR
- Multiple drive support
    > This runs by threading each process, so the loading bar will only display the progress of one process, but you can for example, secure erase 5 drives at once if you would like. Simply select each drive and hit Secure Erase.
- New Icon
- Live display of what is actually happening to the drive.
- Summary of what was done to the drive at the end of each process.
- And much, much more!!! 

11/17/15 - UPDATE Version 1.2

-Fixed bug where the Startup Drive could not be used.

-Added warning that modifying the boot volume can damage user data.
