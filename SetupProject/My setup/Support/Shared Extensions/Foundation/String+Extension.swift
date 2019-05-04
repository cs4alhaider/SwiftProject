//
//  String+Extension.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

extension String {
    
    /// Shortcut for localizing any string like: NSLocalizedString(self, comment: "")
    ///
    /// - Author: Abdullah Alhaider
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Supporting PrintHelper file
    ///
    /// - Author: Abdullah Alhaider
    var logFilePath: String {
        let pathComponents = self.components(separatedBy: "/")
        let index = pathComponents.lastIndex(of: "SetupProject")
        return pathComponents.suffix(pathComponents.count - (index ?? 0)).joined(separator: " > ")
    }
    
    /// Shortcut for Notification.Name like: Notification.Name(rawValue: "string")
    ///
    /// - Author: Abdullah Alhaider
    var asNotificationName: Notification.Name {
        return Notification.Name(rawValue: self)
    }
}
