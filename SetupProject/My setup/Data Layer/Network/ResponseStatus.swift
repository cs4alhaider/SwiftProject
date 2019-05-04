//
//  ResponseStatus.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

typealias Response<T: Decodable> = (ResponseStatus<T>) -> Void

enum ResponseStatus<T: Decodable> {
    case success(T)
    case failure(Error)
}

