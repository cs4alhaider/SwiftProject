//
//  UITableViewCell+Extention.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 10/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    /// Animating the cell in `willDisplay`
    ///
    /// - Parameter duration: The total duration of the animations
    func animateCell(duration: TimeInterval = 0.4) {
        // 1. setting the initial state of the cell
        self.alpha = 0.3
        // let transform = CATransform3DRotate(CATransform3DIdentity, 250, 360, 0, 0) // option 1
        // let transform = CATransform3DMakeScale(0.5,0.5,0.5) // option 2
        // let transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(Double.pi)/2, 0, 1, 0) // option 3
        let transform = CATransform3DMakeScale(0.1,0.1,1)
        self.layer.transform = transform
        
        // 2. UIView animation method to change the final state of the cell
        UIView.animate(withDuration: duration) {
            self.alpha = 1.0
            self.layer.transform = CATransform3DIdentity
        }
    }
}

