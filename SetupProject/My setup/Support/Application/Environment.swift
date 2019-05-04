//
//  Environment.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

enum Environment {
    
    case production
    case development
    
    static var baseURL: String {
        return Environment.current == production ? production.url : development.url
    }
    
    static var current: Environment {
        #if DEBUG
        return .development
        #else
        return .production
        #endif
    }
    
    private var url: String {
        switch self {
        case .production:
            return "https://alhaider.net"
        case .development:
            return "https://api.myjson.com" // change it to your url
        }
    }
}
