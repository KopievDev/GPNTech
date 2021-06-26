//
//  WellDetail.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 26.06.2021.
//

import UIKit

class WellDetailViewController: UIViewController {
    
    var wellDetailArray = [String]()
    let wellView = WellDetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(wellView)
        wellDetailArray.append("Секции ЭЦН")
        wellDetailArray.append("Секции ЭЦН")
        wellDetailArray.append("Секции ЭЦН")
        wellDetailArray.append("ПЭД")
        wellDetailArray.append("Шламоуловители")
        wellDetailArray.append("Газосепараторы")
        wellDetailArray.append("Сливной клапан")
        wellDetailArray.append("Основная линия")
        wellDetailArray.append("Термовставка")
        wellDetailArray.append("Удлинитель с муфтой")
        wellView.frame = view.frame
        wellView.wellTableView.dataSource = self
        wellView.wellTableView.delegate = self
    }
    
}

//MARK: - DataSource
extension WellDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wellDetailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WellDetailCell.id, for: indexPath) as? WellDetailCell else { return UITableViewCell()}
        cell.nameLabel.text = wellDetailArray[indexPath.row]
        return cell
    }
}

extension WellDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = CatalogDetailViewController()
//        detailVC.titleLabel = catalogArray[indexPath.row]
//        detailVC.catalogView.timeLabel.text = catalogView.timeLabel.text
//        if SaleTimer.shared.timerIsActive {
//            detailVC.timer(on: true)
//        }
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}

