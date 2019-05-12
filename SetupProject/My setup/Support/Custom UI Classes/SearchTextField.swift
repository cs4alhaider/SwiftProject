//
//  SearchTextField.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 12/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

protocol SearchTextFieldDelegate: class {
    func searchTextField(_ searchTextField: UITextField, textDidChange searchText: String)
    func cancelDidTapped(_ sender: UIButton)
}

class SearchTextField: UIControl {
    
    @IBOutlet weak var textField: TextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    weak var delegate: SearchTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addSubviewFromNib()
        textField.backgroundColor = .clear
        textField.setPlaceHolderTextColor(.lightGray)
        cancelButton.display = .hidden
        textField.keyboardAppearance = .dark
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        delegate?.searchTextField(sender, textDidChange: text)
        sendActions(for: .editingChanged)
    }
    
    @IBAction func didBeginEditing(_ sender: UITextField) {
        cancelButton.animate(.showView(duruation: 0.2))
    }
    
    @IBAction func didEndEditing(_ sender: UITextField) {
        cancelButton.animate(.hideView(duruation: 0.2))
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        delegate?.cancelDidTapped(sender)
    }
}
