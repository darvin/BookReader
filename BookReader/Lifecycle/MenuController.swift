/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Menu construction extensions for this sample.
*/

import UIKit

class MenuController {
    
    
    init(with builder: UIMenuBuilder) {
        // First remove the menus in the menu bar that aren't needed, in this case the Format menu.
        builder.remove(menu: .format)
        
        // Create and add Open menu command at the beginning of the File menu.
        builder.insertChild(MenuController.openMenu(), atStartOfMenu: .file)
    
        
        
    }
        
    class func openMenu() -> UIMenu {
        let openCommand =
            UIKeyCommand(title: NSLocalizedString("OpenTitle", comment: ""),
                         image: nil,
                         action: #selector(HostingController.openAction),
                         input: "o",
                         modifierFlags: .command)
        let openMenu =
            UIMenu(title: "",
                   image: nil,
                   identifier: .openMenu,
                   options: .displayInline,
                   children: [openCommand])
        return openMenu
    }
    
    

    
    
}

extension UIMenu.Identifier {
    
    static var openMenu: UIMenu.Identifier { UIMenu.Identifier("org.standard.BookReader.menus.openMenu") }
       
}
