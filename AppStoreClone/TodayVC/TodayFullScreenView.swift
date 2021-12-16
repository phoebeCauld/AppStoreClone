//
//  TodayFullScreenView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 07.12.2021.
//

import UIKit

class TodayFullScreenView: UITableViewController {
    
    var dismisFullVIew: (() -> ())?
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabView()
    }
    
    func configTabView(){
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = todayItem?.backgroungColor
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let headerCell = TopFullViewCell()
            headerCell.todayCell.todayItem = todayItem
            headerCell.closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

            return headerCell
        }
        let cell = FullViewDescriptionCell()
        cell.backgroundColor = todayItem?.backgroungColor
        return cell
    }
    
    @objc func dismissView(_ button: UIButton){
        button.isHidden = true
        dismisFullVIew?()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 500
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
