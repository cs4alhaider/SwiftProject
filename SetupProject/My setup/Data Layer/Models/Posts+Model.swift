//
//  Posts+Model.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

struct ModelPost: Codable {
    let statusCode: String?
    let posts: [ModelPostElement]?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "STATUS_CODE"
        case posts = "posts"
    }
}

struct ModelPostElement: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}

extension ModelPost {
    
    static func getPosts(completion: @escaping Response<ModelPost>) {
        Router.PostRouter.allPosts.request(completion: completion)
    }
}
