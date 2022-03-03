//
//  EmailViewController.swift
//  HomeWorkUIKit
//
//  Created by Егор Астахов on 02.03.2022.
//

import UIKit

// MARK: - Class

class EmailViewController: UIViewController {
    
    let someView = CustomView(placeHolder: .email)
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = someView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someView.customButton.addTarget(self, action: #selector(emailValidate), for: .touchUpInside)
    }
    
}

// MARK: - Extension

extension EmailViewController {
    
    @objc
    private func emailValidate() {
        let regExString = "([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}@([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}\\.([a-z0-9]){2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: someView.customTextField.text)
        
        someView.customValidateLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        someView.customValidateLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
}
