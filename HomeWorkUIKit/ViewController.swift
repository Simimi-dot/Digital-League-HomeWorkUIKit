//
//  ViewController.swift
//  HomeWorkUIKit
//
//  Created by Егор Астахов on 02.03.2022.
//

import UIKit

// MARK: - Class
class ViewController: UIViewController {

// MARK: - Properties
    private lazy var nameButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("Имя", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushToNameViewContoller), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("Email", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushToEmailViewContoller), for: .touchUpInside)
        return button
    }()
    
    

// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
}

// MARK: - Extension

extension ViewController {
    private func configureView() {
        view.backgroundColor = .darkGray
        
        view.addSubview(nameButton)
        view.addSubview(emailButton)
        
        NSLayoutConstraint.activate([
            nameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            nameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            emailButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 50),
            emailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    @objc
    private func pushToNameViewContoller() {
        navigationController?.pushViewController(NameViewController(), animated: true)
    }
    
    @objc
    private func pushToEmailViewContoller() {
        navigationController?.present(EmailViewController(), animated: true, completion: nil)
    }
    
    
}

