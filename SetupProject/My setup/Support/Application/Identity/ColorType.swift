//
//  ColorType.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

enum ColorType {
    case primary
    case textColor
    case background
    
    var color: UIColor {
        switch self {
        case .primary:
            return .primary
        case .textColor:
            return .textColor
        case .background:
            return .background
        }
    }
}
