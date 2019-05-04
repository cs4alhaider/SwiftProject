//
//  Identity.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

struct Identity {
    
    static func font(_ type: FontType) -> UIFont {
        return type.font
    }
    
    static func color(_ type: ColorType) -> UIColor {
        return type.color
    }
}
