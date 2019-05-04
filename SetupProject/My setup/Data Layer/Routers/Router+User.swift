//
//  Router+User.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

extension Router {
    
    enum UserRouter: MyEndpoint {
        
        case register(username: String, email: String, password: String)
        case login(username: String, password: String)
        
        var serviceUrl: String {
            switch self {
            case .register:
                return ""
            case .login:
                return ""
            }
        }
        
        var headers: [String : String]? {
            switch self {
            case .register:
                return nil
            case .login:
                return ["USER_ID": "Any thing"]
            }
        }
        
        var isPrintable: Bool {
            switch self {
            case .register:
                return false
            case .login:
                return true
            }
        }
        
        var parameters: [String : Any]? {
            var params: [String : Any] = [:]
            switch self {
            case .register(let username, let email, let password):
                params["USER_NAME"] = username
                params["EMAIL"] = email
                params["PASSWORD"] = password
            case .login(let username, let password):
                params["USER_NAME"] = username
                params["PASSWORD"] = password
            }
            return params
        }
        
    }
}
