//
//  BaseViewController.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    /// Error form any response
    /// Set this property and automatically will show the alert
    ///
    /// - Author: Abdullah Alhaider
    var error: Error? {
        didSet {
            alert(.failure, title: error?.localizedDescription, buttonTitle: "OK".localized)
            logError(error)
        }
    }
    
    /// UIView used as loader
    ///
    /// - Author: Abdullah Alhaider
    private lazy var loadingView: Loader = {
        let frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        let view = Loader(frame: frame)
        return view
    }()
    
    /// Light content for the status bar
    ///
    /// - Author: Abdullah Alhaider
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetupForUI()
        setupForUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        logError("Memory warning!")
    }
    
    func setupForUI() { }
    
    /// Setting the defualts ui
    ///
    /// - Author: Abdullah Alhaider
    func baseSetupForUI() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColor]
        view.backgroundColor = Identity.color(.background)
    }
    
    /// Starting the animating
    ///
    /// - Author: Abdullah Alhaider
    func startAnimating() {
        view.addSubview(loadingView)
        loadingView.layer.zPosition = 1
        loadingView.anchorToEdges(view: view)
        loadingView.start()
    }
    
    /// Stoping the animaing
    ///
    /// - Author: Abdullah Alhaider
    func stopAnimating() {
        loadingView.stop()
    }
    
}
