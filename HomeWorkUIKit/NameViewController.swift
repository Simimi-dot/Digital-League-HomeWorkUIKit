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
    lazy var nameView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var nameTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите имя..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
    }()
    
    lazy var nameButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nameValidate), for: .touchUpInside)
        return button
    }()
    
    lazy var nameValidateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидацию имени"
        return label
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNameView()
    }
    
}

// MARK: - Extension

extension NameViewController {
    private func configureNameView() {
        view.backgroundColor = .darkGray
        
        view.addSubview(nameView)
        
        nameView.addSubview(nameTextField)
        nameView.addSubview(nameButton)
        nameView.addSubview(nameValidateLabel)
        
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            nameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -16),
            
            nameButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            nameButton.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 16),
            nameButton.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -16),
            
            nameValidateLabel.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 16),
            nameValidateLabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 16),
            nameValidateLabel.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -16),
            nameValidateLabel.bottomAnchor.constraint(equalTo: nameView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc
    private func nameValidate() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)
        
        nameValidateLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        nameValidateLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
    
    
}
