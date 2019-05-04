//
//  Loader.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

class Loader: UIView {
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .whiteLarge
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        alpha = 0
        animate(.showView(duruation: 0.4))
    }
    
    func start() {
        addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        indicator.startAnimating()
    }
    
    func stop() {
        indicator.stopAnimating()
        animate(.hideView(duruation: 0.2))
        removeFromSuperview()
    }
}
