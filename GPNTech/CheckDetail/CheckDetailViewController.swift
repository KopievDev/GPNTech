//
//  CheckDetailViewController.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 27.06.2021.
//

import UIKit

class CheckDetailViewController: UIViewController {
    
    let typeSizeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Типоразмер - 122ЭЦНКИД5-80"
        return label
    }()
    
    let stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Состояние - Новый"
        return label
    }()

    let lengthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Длина - 4.5 м"
        return label
    }()

    let classEEFLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Класс ээф - e1"
        return label
    }()
    
    let groupLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Группа исполнения - Группа 3"
        return label
    }()
    
    let stepLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Количество ступеней - 146"
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Напор - 865"
        return label
    }()


    let editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Корректировать", for: .normal)
        return button
    }()

    let enterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0, green: 0.447, blue: 0.729, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сформировать акт", for: .normal)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(typeSizeLabel)
        view.addSubview(stateLabel)
        view.addSubview(lengthLabel)
        view.addSubview(classEEFLabel)
        view.addSubview(groupLabel)
        view.addSubview(stepLabel)
        view.addSubview(pressureLabel)
        view.addSubview(editButton)
        view.addSubview(enterButton)
        enterButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)


        NSLayoutConstraint.activate([
            typeSizeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            typeSizeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            typeSizeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            typeSizeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            stateLabel.topAnchor.constraint(equalTo: typeSizeLabel.bottomAnchor, constant: 10),
            stateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            lengthLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 10),
            lengthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lengthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lengthLabel.heightAnchor.constraint(equalToConstant: 20),
            
            classEEFLabel.topAnchor.constraint(equalTo: lengthLabel.bottomAnchor, constant: 10),
            classEEFLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            classEEFLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            classEEFLabel.heightAnchor.constraint(equalToConstant: 20),
            
            groupLabel.topAnchor.constraint(equalTo: classEEFLabel.bottomAnchor, constant: 10),
            groupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            groupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            groupLabel.heightAnchor.constraint(equalToConstant: 20),
            
            stepLabel.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: 10),
            stepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stepLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stepLabel.heightAnchor.constraint(equalToConstant: 20),
            
            pressureLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: 10),
            pressureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pressureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pressureLabel.heightAnchor.constraint(equalToConstant: 20),
            
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            enterButton.heightAnchor.constraint(equalToConstant: 50),
            
            editButton.bottomAnchor.constraint(equalTo: enterButton.topAnchor, constant: -16),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.heightAnchor.constraint(equalToConstant: 50),


        
        ])
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "СПО", message: "Акт сформирован и отправлен", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }
}
