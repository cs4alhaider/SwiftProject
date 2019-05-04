//
//  FontType.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

enum FontType {
    
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case description
    case highlightedDescription
    case highlightedCaption
    case caption
    case highlightedBadge
    case badge
    case custom(weight: Font, size: CGFloat)
    
    var font: UIFont {
        switch self {
        case .h1:
            return Font.bold.name.withSize(20)
        case .h2:
            return Font.bold.name.withSize(18)
        case .h3:
            return Font.bold.name.withSize(17)
        case .h4:
            return Font.regular.name.withSize(17)
        case .h5:
            return Font.regular.name.withSize(16)
        case .h6:
            return Font.regular.name.withSize(15)
        case .highlightedDescription:
            return Font.bold.name.withSize(14)
        case .description:
            return Font.regular.name.withSize(14)
        case .highlightedCaption:
            return Font.bold.name.withSize(13)
        case .caption:
            return Font.regular.name.withSize(13)
        case .highlightedBadge:
            return Font.bold.name.withSize(10)
        case .badge:
            return Font.regular.name.withSize(10)
        case .custom(let weight, let size):
            return weight.name.withSize(size)
        }
    }
}
