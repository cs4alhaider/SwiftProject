//
//  UIView+Extention.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Two cases replacing `isHidden`
    ///
    /// - visible: means `isHidden = false`
    /// - hidden: means `isHidden = true`
    ///
    /// - Author: Abdullah Alhaider.
    enum UIViewDisplayMode {
        case visible
        case hidden
        // Please do not add any extra cases
    }
    
    /// Elegent way to show and hide any UIView insted of `someView.isHidden = true` or `!someView.isHidden = true`
    ///
    /// - Author: Abdullah Alhaider.
    var display: UIViewDisplayMode {
        get {
            return self.isHidden ? .hidden : .visible
        }
        set {
            return self.isHidden = newValue == .hidden ? true : false
        }
    }
    
    // ---------------------------- UIViewAnimation -------------------------------- //
    
    /// Multible of cases to animate any UIView
    ///
    /// - Author: Abdullah Alhaider.
    enum UIViewAnimation {
        /// Will change the color and animate if the duration > 0
        case changeColor(to: UIColor, duration: TimeInterval)
        /// Will hide the view and reduce the alpha value to 0 with animation if the duration > 0
        case hideView(duruation: TimeInterval)
        /// Will show the view and increase the alpha value to 1 with animation if the duration > 0
        case showView(duruation: TimeInterval)
    }
    
    /// Implimntation for all cases in `UIViewAnimation`
    ///
    /// - Parameter animation: UIViewAnimation
    ///
    /// - Author: Abdullah Alhaider.
    func animate(_ animation: UIViewAnimation) {
        switch animation {
        case .changeColor(let newColor, let duration):
            UIView.animate(withDuration: duration) {
                self.backgroundColor = newColor
            }
        case .hideView(let duruation):
            UIView.animate(withDuration: duruation) {
                self.alpha = 0
                self.display = .hidden
            }
        case .showView(let duruation):
            UIView.animate(withDuration: duruation) {
                self.display = .visible
                self.alpha = 1
            }
        }
    }
}
