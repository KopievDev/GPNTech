//
//  ActViewController.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 27.06.2021.
//

import UIKit

class ActViewController: UIViewController {
    
    init() {
          super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Акты", image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis"), tag: 1)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let wellTableView: UITableView = {
        let table = UITableView()
        table.register(WellDetailCell.self, forCellReuseIdentifier: WellDetailCell.id)
        table.backgroundColor = .white
        table.estimatedRowHeight = 48
        return table
    }()
    
    let actArray = ["Акт от 23/03/21","Акт от 24/03/21","Акт от 25/03/21","Акт от 26/03/21"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        view.backgroundColor = .white
        view.addSubview(wellTableView)
        wellTableView.frame = view.frame
        wellTableView.dataSource = self
        
    }
}

extension ActViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WellDetailCell.id, for: indexPath) as? WellDetailCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = actArray[indexPath.row]
        return cell
    }
    
    
    
}
