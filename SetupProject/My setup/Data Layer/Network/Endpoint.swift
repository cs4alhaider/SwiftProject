//
//  Endpoint.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

/// Server endpoint interface, any server router should implement this interface to be able to connect
protocol Endpoint {
    
    /// The last path component to the endpoint. will be appended to the base url in the service
    var serviceUrl: String { get }
    
    /// The encoded parameters
    var parameters: [String: Any]? { get }
    
    /// The HTTP headers to be appended in the request, default is nil
    var headers: [String: String]? { get }
    
    /// Http method as specified by the server
    var method: HTTPMethod { get }
    
    /// Determind if you want to print the response in the consol or not
    var isPrintable: Bool { get }
    
    /// Calling the API for the defined router endpoint. the default implementation should not be ignored
    func request<T: Codable>(completion: @escaping Response<T>)
}
