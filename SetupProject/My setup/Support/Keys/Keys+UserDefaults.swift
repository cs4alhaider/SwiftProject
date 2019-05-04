//
//  Keys+UserDefaults.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

/*--------------------------------------------------------------------------------*/
/// Add every UserDefaults key here to organize our work and to avoid dublications.
/*--------------------------------------------------------------------------------*/

import Foundation

extension Keys {
    
    /// Namespacing the constants we use in the defaults system.
    struct UserDefaults {
        
        /// session id
        static let sessionID = "com.SetupProject.UserDefaults.sessionID"
        
    }
}
