//
//  WellView.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 26.06.2021.
//

import UIKit

class WellView: UIView {

    let searchTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 13)
        textfield.clearButtonMode = .whileEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftViewMode = .always
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.setIcon(UIImage(named:"search"))
        textfield.returnKeyType = .go
        textfield.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        textfield.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)])
        return textfield
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Скважины"
        return label
    }()
        
    let wellTableView: UITableView = {
        let table = UITableView()
        table.register(CatalogCell.self, forCellReuseIdentifier: CatalogCell.id)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 48
        return table
    }()
    
    let logoImageView: UIImageView = {
       let iv = UIImageView(image: UIImage(named: "logo"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addSubview(searchTextfield)
        addSubview(titleLabel)
        addSubview(wellTableView)
        addSubview(logoImageView)
        createConstaints()
        backgroundColor = .white
        
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            searchTextfield.heightAnchor.constraint(equalToConstant: 40),
            searchTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            searchTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
         
            
            wellTableView.topAnchor.constraint(equalTo: searchTextfield.bottomAnchor, constant: 10),
            wellTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            wellTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            wellTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 25),
            logoImageView.widthAnchor.constraint(equalToConstant: 25),


            

        ])
        
    }

}
