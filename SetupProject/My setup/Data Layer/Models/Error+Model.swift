//
//  Error+Model.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

struct ModelError: Codable {
    let statusCode: String?
    let errorCode: String?
    let backendErrorDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "STATUS_CODE"
        case errorCode = "ERROR_CODE"
        case backendErrorDescription = "ERROR_DESCRIPTION"
    }
}

extension ModelError: Error, LocalizedError {
    
    /// Override `errorDescription`, from `LocalizedError` protocol to return the backend error.
    var errorDescription: String? {
        return backendErrorDescription
    }
}
