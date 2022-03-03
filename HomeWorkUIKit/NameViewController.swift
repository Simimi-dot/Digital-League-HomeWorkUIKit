//
//  NameViewController.swift
//  HomeWorkUIKit
//
//  Created by Егор Астахов on 02.03.2022.
//

import UIKit

// MARK: - Class

class NameViewController: UIViewController {
    
    // MARK: - Properties
    let someView = CustomView(placeHolder: .name)
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = someView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someView.customButton.addTarget(self, action: #selector(nameValidate), for: .touchUpInside)
    }
    
}

// MARK: - Extension

extension NameViewController {
    
    @objc
    private func nameValidate() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: someView.customTextField.text)
        
        someView.customValidateLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        someView.customValidateLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
}
