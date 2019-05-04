//
//  Keys+NotificationCenter.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

/*--------------------------------------------------------------------------------*/
/// Add every Notification.Name here to organize our work and to avoid dublications.
/*--------------------------------------------------------------------------------*/

import Foundation

extension Keys {
    
    struct NotificationCenter {
        
        // This is an example
        
        /// Notify about the user when he log in
        static let userLoggedIn = "com.SetupProject.notification.userLoggedIn".asNotificationName
        
    }
}
