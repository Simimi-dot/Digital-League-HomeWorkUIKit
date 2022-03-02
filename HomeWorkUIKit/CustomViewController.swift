//
//  CustomViewController.swift
//  HomeWorkUIKit
//
//  Created by Егор Астахов on 02.03.2022.
//

import UIKit

// MARK: - Class
class CustomViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var customView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var customTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пустое поле..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
    }()
    
    lazy var customButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var customValidateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидацию"
        return label
    }()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomView()
    }
    
    
}

// MARK: - Extension

extension CustomViewController {
    private func configureCustomView() {
        view.backgroundColor = .darkGray
        
        view.addSubview(customView)
        
        customView.addSubview(customTextField)
        customView.addSubview(customButton)
        customView.addSubview(customValidateLabel)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            customTextField.topAnchor.constraint(equalTo: customView.topAnchor, constant: 16),
            customTextField.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            customTextField.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            
            customButton.topAnchor.constraint(equalTo: customTextField.bottomAnchor, constant: 16),
            customButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            customButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            
            customValidateLabel.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 16),
            customValidateLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            customValidateLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            customValidateLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -16)
        ])
    }
    
//    @objc
//    private func nameValidate() {
//        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
//        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
//        let isValid = predicate.evaluate(with: nameTextField.text)
//
//        nameValidateLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
//        nameValidateLabel.textColor = isValid ? .systemGreen : .systemRed
//    }
    
    
}
