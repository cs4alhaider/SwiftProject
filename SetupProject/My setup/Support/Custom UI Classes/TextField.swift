//
//  TextField.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 12/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    var cornerRadius: CGFloat = 8 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    var borderWidth: CGFloat = 0.5 {
        didSet {
            refreshBorderWidth(value: borderWidth)
        }
    }
    
    // MARK: - init methods
    
    /// Initializing this class for programmatic use.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    /// Initializing this class for interface builder (Storyboard) use.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    /// Main method to be executed.
    private func setupViews() {
        update(to: .lightGray)
    }
    
    /// Updating the proprties.
    ///
    /// - Parameter color: Identity.color(.MWhite).
    private func update(to color: UIColor) {
        backgroundColor = .clear
        layer.borderColor = color.cgColor
        borderStyle = .none
        textColor = Identity.color(.textColor)
        refreshCorners(value: cornerRadius)
        refreshBorderWidth(value: borderWidth)
    }
    
    /// Refreshing the corners radius.
    ///
    /// - Parameter value: the value to set to the cornerRadius.
    private func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    /// Refreshing the border width
    ///
    /// - Parameter value: the value to set to the borderWidth.
    private func refreshBorderWidth(value: CGFloat) {
        layer.borderWidth = value
    }
    
    // MARK: - Handling and adding the left and right padding
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding(plusExtraFor: .unlessEditing)
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding(plusExtraFor: .unlessEditing)
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding(plusExtraFor: .whileEditing)
        return bounds.inset(by: padding)
    }
    
    /// Handeling the rightView and leftView on the textfield
    ///
    /// - Parameter clearButtonMode: .unlessEditing, .whileEditing, ...
    /// - Returns: UIEdgeInsets
    private func getPadding(plusExtraFor clearButtonMode: ViewMode) -> UIEdgeInsets {
        var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        // Add additional padding on the right side when showing the clear button
        if self.clearButtonMode == .always || self.clearButtonMode == clearButtonMode {
            padding.right = 25
        }
        return padding
    }
}
