//
//  EmailViewController.swift
//  HomeWorkUIKit
//
//  Created by Егор Астахов on 02.03.2022.
//

import UIKit

// MARK: - Class

class EmailViewController: UIViewController {

// MARK: - Properties
    
    let customView = CustomViewController()
    
// MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(customView.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.customButton.addTarget(self, action: #selector(emailValidate), for: .touchUpInside)
    }
    
}

// MARK: - Extension

extension EmailViewController {
    
    @objc
    private func emailValidate() {
        let regExString = "([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}@([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}\\.([a-z0-9]){2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: customView.customTextField.text)

        customView.customValidateLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        customView.customValidateLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
}
