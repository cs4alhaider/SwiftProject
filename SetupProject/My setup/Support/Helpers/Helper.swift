//
//  Helper.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit


struct Helper {
    
    // MARK: - ------------------------------ Haptics -------------------------------------
    
    /// List of feedback
    ///
    /// - light: UIImpactFeedbackGenerator(style: .light)
    /// - medium: UIImpactFeedbackGenerator(style: .medium)
    /// - heavy: UIImpactFeedbackGenerator(style: .heavy)
    /// - success: notificationOccurred(.success)
    /// - waarning: notificationOccurred(.warning)
    /// - error: notificationOccurred(.error)
    ///
    /// - Author: Abdullah Alhaider
    enum ImpactType {
        case light, medium, heavy, success, warning, error
    }
    
    /// A concrete UIFeedbackGenerator subclass that creates haptics to simulate physical impacts.
    ///
    /// - Parameter type: A collision between small, light,.., user interface elements
    ///
    /// - Author: Abdullah Alhaider
    static func feedbackGenerator(type: ImpactType) {
        if #available(iOS 10.0, *) {
            switch type {
            case .light:
                let lightGenerator = UIImpactFeedbackGenerator(style: .light)
                lightGenerator.impactOccurred()
                
            case .medium:
                let mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
                mediumGenerator.impactOccurred()
                
            case .heavy:
                let heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
                heavyGenerator.impactOccurred()
                
            case .success:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                
            case .warning:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)
                
            case .error:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            }
        }
    }
    
    // ---------------------------------------------------------------------- //
}
