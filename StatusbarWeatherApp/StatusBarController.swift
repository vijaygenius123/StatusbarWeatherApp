//
//  StatusBarController.swift
//  StatusbarWeatherApp
//
//  Created by Vijayaraghavan Sundararaman on 01/10/2022.
//

import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
        private var popover: NSPopover
    
    init(_ popover: NSPopover) {
            self.popover = popover
            statusBar = NSStatusBar.init()
            statusItem = statusBar.statusItem(withLength: 28.0)
            
            if let statusBarButton = statusItem.button {
                statusBarButton.image = #imageLiteral(resourceName: "Weather")
                statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
                statusBarButton.image?.isTemplate = true
                statusBarButton.action = #selector(togglePopover(sender:))
                statusBarButton.target = self
            }
        }
    
    @objc func togglePopover(sender: AnyObject) {
            if(popover.isShown) {
                hidePopover(sender)
            }
            else {
                showPopover(sender)
            }
        }
        
        func showPopover(_ sender: AnyObject) {
            if let statusBarButton = statusItem.button {
                popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
            }
        }
        
        func hidePopover(_ sender: AnyObject) {
            popover.performClose(sender)
        }
}
