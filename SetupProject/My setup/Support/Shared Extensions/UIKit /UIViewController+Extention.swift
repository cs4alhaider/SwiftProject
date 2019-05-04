//
//  UIViewController+Extention.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Setting the navigation title and tab bar title
    ///
    /// - Parameters:
    ///   - navigationTitle: Navigation title
    ///   - tabBarTitle: TabBar title
    ///
    /// - Author: Abdullah Alhaider.
    func setTitles(navigationTitle: String? = nil, tabBarTitle: String? = nil) {
        // Order is important here!
        if let tabBarTitle = tabBarTitle {
            title = tabBarTitle
        }
        if let navigationTitle = navigationTitle {
            navigationItem.title = navigationTitle
        }
    }
    
    /// Typealias for alertButtonAction
    ///
    /// - Author: Abdullah Alhaider
    typealias AlertButtonAction = (() -> Void)?
    
    /// Enum for alert type
    ///
    /// - success: success alert
    /// - failure: failure alert
    /// - normal: normal alert
    ///
    /// - Author: Abdullah Alhaider
    enum AlertType {
        case success, failure, normal
        
    }
    
    func alert(_ alertType: AlertType,
               title: String? = nil,
               body: String? = nil,
               dismissAfter: TimeInterval? = nil,
               buttonTitle: String? = nil,
               completion: AlertButtonAction = nil) {
        
        guard let vc = UIApplication.topViewController() else { return }
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        if let buttonTitle = buttonTitle {
            let ok = UIAlertAction(title: buttonTitle, style: .default) { (_) in
                completion?()
            }
            alert.addAction(ok)
        }
        // Accessing alert view backgroundColor :
        switch alertType {
        case .success:
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case .failure:
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = #colorLiteral(red: 0.7967291667, green: 0.1695612325, blue: 0.08168510124, alpha: 1)
        case .normal:
            break
        }
        // Accessing buttons tintcolor :
        alert.view.tintColor = .black
        
        // presinting the alert controller ...
        vc.present(alert, animated: true, completion: nil)
        
        if let timeToDismiss = dismissAfter {
            DispatchQueue.main.asyncAfter(deadline: .now() + timeToDismiss) {
                vc.dismiss(animated: true, completion: nil)
            }
        }
    }
}
