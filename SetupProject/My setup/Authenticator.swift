//
//  Authenticator.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

struct Authenticator {
    
    static var shared = Authenticator()
    private init() {}
    
    var sessionId: String? {
        get {
            return UserDefaults.standard.string(forKey: Keys.UserDefaults.sessionID)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.UserDefaults.sessionID)
        }
    }
    
}
