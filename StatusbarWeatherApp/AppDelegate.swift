import Cocoa
import SwiftUI

@main
struct StatusbarWeatherApp: App{
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene{
        WindowGroup{
            ContentView()
        }
    }
}


class AppDelegate: NSObject, NSApplicationDelegate {

    var statusBar: StatusBarController?
    var popover = NSPopover.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.contentViewController = NSHostingController(rootView: contentView)
        statusBar = StatusBarController.init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
