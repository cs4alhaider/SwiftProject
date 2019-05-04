//
//  Router+Post.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

extension Router {
    
    enum PostRouter: MyEndpoint {
        
        case allPosts
        
        var serviceUrl: String {
            switch self {
            case .allPosts:
                return "/bins/14fgl0"
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .allPosts:
                return nil
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .allPosts:
                return .get
            }
        }
        
    }
}
