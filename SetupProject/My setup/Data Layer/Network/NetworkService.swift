//
//  NetworkService.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider . All rights reserved.
//

import Alamofire

enum NetworkResponse {
    case success(Data)
    case failure(Error)
}

class NetworkService {
    
    static func request(url: String,
                        headers: [String: String]? = nil,
                        httpMethod: HTTPMethod,
                        parameters: [String: Any]? = nil,
                        isPrintable: Bool,
                        completion: @escaping (NetworkResponse) -> Void) {
        
        let date = Date()
        
        logNetwork("""
            🙇‍♂️ \(httpMethod.rawValue.uppercased()) '\(url)':
            📝 Request headers = \(headers?.json ?? "No Headers")
            📝 Request Body = \(parameters?.json ?? "No Parameters")
            """ )
        
        Alamofire.request(url,
                          method: httpMethod == .get ? .get : .post,
                          parameters: parameters,
                          encoding: httpMethod == .get ? URLEncoding.default : JSONEncoding.default,
                          headers: headers).responseJSON { response in
                            switch response.result {
                            case .success:
                                guard let data = response.data else { return }
                                completion(.success(data))
                                if isPrintable {
                                    logNetwork("""
                                        ✅ Response: \(response.request?.httpMethod?.uppercased() ?? "") '\(url)':
                                        🧾 Status Code: \(response.response?.statusCode ?? 0), \(response.result), 💾 \(data), ⏳ time: \(Date().timeSince(date))
                                        ⬇️ Response headers = \(response.response?.allHeaderFields.json ?? "No Headers")
                                        ⬇️ Response Body = \(String(data: data, encoding: String.Encoding.utf8) ?? "")
                                        """ )
                                }
                            case .failure(let error):
                                completion(.failure(error))
                                logNetwork("""
                                    ❌ Error in response: \(response.request?.httpMethod?.uppercased() ?? "") '\(url)' (\(response.response?.statusCode ?? 0), \(response.result)):
                                    ❌ Error: \(error)
                                    ⬇️ Response headers = \(response.response?.allHeaderFields.json ?? "No Headers")
                                    """ )
                            }
        }
    }
}
