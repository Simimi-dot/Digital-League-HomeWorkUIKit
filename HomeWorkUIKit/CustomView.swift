//
//  CustomView.swift
//  HomeWorkUIKit
//
//  Created by Егор Астахов on 02.03.2022.
//

import UIKit

// MARK: - Enum
enum PlaceHolder: String {
    case name = "Введите имя и фамилию..."
    case email = "Введите email..."
}

// MARK: - Class
class CustomView: UIView {
    
    // MARK: - Properties
    
    lazy private var customView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var customTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK: - Init
    
    init(placeHolder: PlaceHolder) {
        super.init(frame: .zero)
        self.customTextField.placeholder = placeHolder.rawValue
        configure()
        keyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Method
    
    private func configure() {
        self.backgroundColor = .darkGray
        
        self.addSubview(customView)
        
        self.addSubview(customTextField)
        self.addSubview(customButton)
        self.addSubview(customValidateLabel)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 250),
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
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
    
    private func keyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.frame.origin.y == 0 {
                self.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc
    private func keyboardWillHide(notification: NSNotification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }
    
}
