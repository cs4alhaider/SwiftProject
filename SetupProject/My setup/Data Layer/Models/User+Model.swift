//
//  User+Model.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

struct User: Codable {
    
    static var current: User?
    
    let name: String?
    let email: String?
    let role: UserRole?
    let sessionID: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "NAME"
        case email = "EMAIL"
        case role = "ROLE"
        case sessionID = "SESSION_ID"
    }
}

enum UserRole: String, Codable {
    case admin
    case customer
}

extension User {
    
    // This way you can request one time and save the response in the `User.current` and access it anywhere ..
    
    static func login(username: String, password: String, completion: @escaping Response<User>) {
        _login(username: username, password: password) { (result) in
            switch result {
            case .success(let user):
                completion(.success(user))
                Authenticator.shared.sessionId = user.sessionID
                User.current = user
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private static func _login(username: String, password: String, completion: @escaping Response<User>) {
        Router.UserRouter.login(username: username, password: password).request(completion: completion)
    }
}
