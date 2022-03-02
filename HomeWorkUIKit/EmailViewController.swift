//
//  EmailViewController.swift
//  HomeWorkUIKit
//
//  Created by Егор Астахов on 02.03.2022.
//

import UIKit

// MARK: - Class
class EmailViewController: UIViewController {

    let customView = CustomViewController()
// MARK: - Properties
//    lazy var emailView: UIView = {
//       var view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemGray
//        view.layer.cornerRadius = 10
//        return view
//    }()
//
//    lazy var emailTextField: UITextField = {
//        var textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.placeholder = "Введите email..."
//        textField.borderStyle = .roundedRect
//        textField.backgroundColor = .systemBackground
//        return textField
//    }()
//
//    lazy var emailButton: UIButton = {
//       var button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Проверить", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.cornerRadius = 10
//        button.backgroundColor = .orange
//        button.addTarget(self, action: #selector(emailValidate), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var emailValidateLabel: UILabel = {
//       var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Ожидаю валидацию почты"
//        return label
//    }()
    

// MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(customView.view)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureEmailView()
    }
    
    
}

// MARK: - Extension

extension EmailViewController {
//    private func configureEmailView() {
//        view.backgroundColor = .darkGray
//
//        view.addSubview(emailView)
//
//        emailView.addSubview(emailTextField)
//        emailView.addSubview(emailButton)
//        emailView.addSubview(emailValidateLabel)
//
//        NSLayoutConstraint.activate([
//            emailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
//            emailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            emailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 16),
//            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 16),
//            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -16),
//
//            emailButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
//            emailButton.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 16),
//            emailButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -16),
//
//            emailValidateLabel.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 16),
//            emailValidateLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 16),
//            emailValidateLabel.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -16),
//            emailValidateLabel.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -16)
//
//        ])
//    }
//
//    @objc
//    private func emailValidate() {
//        let regExString = "([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}@([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}\\.([a-z0-9]){2,64}"
//        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
//        let isValid = predicate.evaluate(with: emailTextField.text)
//
//        emailValidateLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
//        emailValidateLabel.textColor = isValid ? .systemGreen : .systemRed
//    }
    
}
