//
//  AuthAssertViewController.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 26.06.2021.
//

import UIKit

class AuthAssertViewController: UIViewController {

    let phoneTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 13)
        textfield.clearButtonMode = .whileEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftViewMode = .always
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.autocorrectionType = .no
        textfield.keyboardType = .phonePad
        textfield.isUserInteractionEnabled = false
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        
        textfield.leftViewMode = .always
        textfield.returnKeyType = .go
        textfield.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
        textfield.layer.borderWidth = 0.6

        textfield.layer.borderColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1).cgColor
        textfield.attributedPlaceholder = NSAttributedString(string: "+7 (999) 999 99-99", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)])
        return textfield
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите код из смс"
        return label
    }()
    
    let firstNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1).cgColor
        label.layer.cornerRadius = 8
        return label
    }()
    
    let secondNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1).cgColor
        label.layer.cornerRadius = 8
        return label
    }()
    
    let thirdNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1).cgColor
        label.layer.cornerRadius = 8
        return label
    }()
    let quatroNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1).cgColor
        label.layer.cornerRadius = 8
        return label
    }()

    
    let enterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        return button
    }()
    
    let indicator: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: .large)
        ind.color = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1)
        ind.hidesWhenStopped = true
        ind.translatesAutoresizingMaskIntoConstraints = false
        return ind
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(phoneTextfield)
        view.addSubview(enterButton)
        view.addSubview(firstNumberLabel)
        view.addSubview(secondNumberLabel)
        view.addSubview(thirdNumberLabel)
        view.addSubview(quatroNumberLabel)
        view.addSubview(indicator)

        createConstraints()
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        indicator.startAnimating()

        DispatchQueue.global().async {
            do {
                sleep(1)
                DispatchQueue.main.async {
                    self.getCode()

                }
            }

        }
       
    }
    @objc func getCode() {
        let one = Int.random(in: 1...9)
        let two = Int.random(in: 1...9)
        let three = Int.random(in: 1...9)
        let four = Int.random(in: 1...9)

        NotificationManager.shared.showNotification(title: "Код подтверждения",
                                                    body: "\(one)\(two)\(three)\(four)  - Никому не сообщайте данный код",
                                                    identifier: "Notification event")
        
        do {
            sleep(2)
        }
        firstNumberLabel.text = "\(one)"
        secondNumberLabel.text = "\(two)"
        thirdNumberLabel.text = "\(three)"
        quatroNumberLabel.text = "\(four)"
        indicator.stopAnimating()

    }
    
    @objc func goToHome() {
        dismiss(animated: true) { [weak self]  in
            let target = MainTabBarViewController()
            self?.present(target, animated: true)
        }

    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            phoneTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            phoneTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            phoneTextfield.heightAnchor.constraint(equalToConstant: 48),

            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -34),
            enterButton.heightAnchor.constraint(equalToConstant: 50),
            
            firstNumberLabel.topAnchor.constraint(equalTo: phoneTextfield.bottomAnchor, constant: 31),
            firstNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 28),
            firstNumberLabel.trailingAnchor.constraint(equalTo: secondNumberLabel.leadingAnchor , constant: -23),
            firstNumberLabel.heightAnchor.constraint(equalToConstant: 64),
            
            secondNumberLabel.topAnchor.constraint(equalTo: firstNumberLabel.topAnchor),
            secondNumberLabel.heightAnchor.constraint(equalToConstant: 64),
            secondNumberLabel.trailingAnchor.constraint(equalTo: thirdNumberLabel.leadingAnchor , constant: -23),
            
            thirdNumberLabel.topAnchor.constraint(equalTo: firstNumberLabel.topAnchor),
            thirdNumberLabel.heightAnchor.constraint(equalToConstant: 64),
            thirdNumberLabel.trailingAnchor.constraint(equalTo: quatroNumberLabel.leadingAnchor , constant: -23),
            
            quatroNumberLabel.topAnchor.constraint(equalTo: firstNumberLabel.topAnchor),
            quatroNumberLabel.heightAnchor.constraint(equalToConstant: 64),
            quatroNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -28),
            quatroNumberLabel.widthAnchor.constraint(equalTo: firstNumberLabel.widthAnchor),
            secondNumberLabel.widthAnchor.constraint(equalTo: firstNumberLabel.widthAnchor),
            thirdNumberLabel.widthAnchor.constraint(equalTo: firstNumberLabel.widthAnchor),

            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 50),
            indicator.widthAnchor.constraint(equalTo: indicator.heightAnchor)



            
            

        ])
    }
}
