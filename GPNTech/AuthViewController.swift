//
//  AuthViewController.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 26.06.2021.
//

import UIKit

class AuthViewController: UIViewController {

    
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          navigationController?.setNavigationBarHidden(true, animated: animated)
      }

      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          navigationController?.setNavigationBarHidden(false, animated: animated)
      }


    lazy var phoneTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 13)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftViewMode = .always
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.autocorrectionType = .no
        textfield.keyboardType = .phonePad
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textfield.setRightIcon(UIImage(named: "delete"))
        textfield.backgroundColor = UIColor(red: 0.957, green: 0.996, blue: 0.965, alpha: 1)
        textfield.layer.borderWidth = 0.6
        textfield.layer.borderColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1).cgColor
        textfield.attributedPlaceholder = NSAttributedString(string: "+7 (999) 999 99-99", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)])
        textfield.delegate = self
        return textfield
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вход по номеру телефона"
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
        button.setTitle("Получить код", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        enterButton.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
          UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 0.74).cgColor,
          UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 0).cgColor
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.81, c: -0.81, d: 0.01, tx: 0.9, ty: -0.01))
        gradientLayer.frame = view.frame
        
        view.layer.addSublayer(gradientLayer)
        view.addSubview(titleLabel)
        view.addSubview(phoneTextfield)
        view.addSubview(enterButton)
        createConstraints()
    }
    
    @objc func goNext() {
        let authAssert = AuthAssertViewController()
        if !phoneTextfield.isEmpty() {
            if phoneTextfield.text?.first == "+" {
                authAssert.phoneTextfield.text = phoneTextfield.text!

            } else {
                authAssert.phoneTextfield.text = "+7" + phoneTextfield.text!
            }
        }
        navigationController?.pushViewController(authAssert, animated: true)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
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
            enterButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

extension AuthViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if (textField == phoneTextfield) {
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let components = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.hasPrefix("7") || decimalString.hasPrefix("8")
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11 {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne {
                formattedString.append("+7 ")
                index += 1
            }
            
            if (length - index) > 3 {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("(%@)", areaCode)
                index += 3
            }
            
            if length - index > 3 {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            textField.text = formattedString as String
            return false
        }
        else {
            return true
        }
    }
}
