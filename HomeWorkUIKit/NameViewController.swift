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
    
    let customView = CustomViewController()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(customView.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.customButton.addTarget(self, action: #selector(nameValidate), for: .touchUpInside)
        
//        configureNameView()
    }
    
}

// MARK: - Extension

extension NameViewController {

    @objc
    private func nameValidate() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: customView.customTextField.text)

        customView.customValidateLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        customView.customValidateLabel.textColor = isValid ? .systemGreen : .systemRed
    }

}
