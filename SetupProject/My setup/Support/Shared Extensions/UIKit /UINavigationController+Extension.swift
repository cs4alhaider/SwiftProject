//
//  UINavigationController+Extension.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    /// Making the status bar changed from the top view controller
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    /// Back to spicefic vc in the stack
    ///
    /// - Parameters:
    ///   - type: vc
    ///   - animated: animated
    func backTo<T: UIViewController>(_ type: T.Type, animated: Bool = true) {
        if let vc = viewControllers.first(where: { $0 is T }) {
            popToViewController(vc, animated: animated)
        }
    }
}
