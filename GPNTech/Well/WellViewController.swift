//
//  WellViewController.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 26.06.2021.
//

import UIKit

class WellViewController: UIViewController {
    
    init() {
          super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Скважены", image: UIImage(systemName: "list.triangle"), tag: 2)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          navigationController?.setNavigationBarHidden(true, animated: animated)
      }

      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          navigationController?.setNavigationBarHidden(false, animated: animated)
      }

    var wellArray = [String]()
    let wellView = WellView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(wellView)
        for _ in 1...20 {
            let number = Int.random(in: 100...233)
            wellArray.append("Скважина №\(number)")
        }
        wellView.frame = view.frame
        wellView.wellTableView.dataSource = self
        wellView.wellTableView.delegate = self
    }
       
}

//MARK: - DataSource
extension WellViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogCell.id, for: indexPath) as? CatalogCell else { return UITableViewCell()}
        cell.nameLabel.text = wellArray[indexPath.row]
        return cell
    }
}

extension WellViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = WellDetailViewController()
        detailVC.title = wellArray[indexPath.row]
        detailVC.wellView.titleLabel.text = "ЭЦНИД5-80-2600"
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
