//
//  Font.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

enum Font {
    
    case bold
    case regular
    case light
    case black
    
    var name: UIFont {
        switch self {
        case .bold:
            return UIFont.boldSystemFont(ofSize: 10)
        // return UIFont(name: "yourFont-Bold", size: 10) ?? UIFont.boldSystemFont(ofSize: 10)
        case .black:
            return UIFont.boldSystemFont(ofSize: 10)
        // return UIFont(name: "yourFont-Black", size: 10) ?? UIFont.boldSystemFont(ofSize: 10)
        case .regular:
            return UIFont.systemFont(ofSize: 10)
        // return UIFont(name: "yourFont-Regular", size: 10) ?? UIFont.systemFont(ofSize: 10)
        case .light:
            return UIFont.systemFont(ofSize: 10)
            // return UIFont(name: "yourFont-Light", size: 10) ?? UIFont.systemFont(ofSize: 10)
        }
    }
}
