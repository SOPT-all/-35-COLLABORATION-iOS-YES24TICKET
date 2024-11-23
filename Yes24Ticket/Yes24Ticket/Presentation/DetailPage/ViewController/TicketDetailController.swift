//
//  TicketDetailController.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then


private let headerIdentifier = "DetailHeaderView"
private let reuseIdentifier = "DetailTableViewCell"

class TicketDetailController: UITableViewController {
    
    private let titles = DetailTableViewTitle.allCases
    
    private func configureTableView() {
        tableView.register(DetailHeaderView.self, forHeaderFooterViewReuseIdentifier: DetailHeaderView.reuseIdentifier)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else {
            
            return UITableViewCell()
        }
        let title = titles[indexPath.row].rawValue
        cell.configure(with: title)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailHeaderView.reuseIdentifier) as? DetailHeaderView else {
            return nil
        }
        
        header.configure(with: .mockData)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 422
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
}

#Preview {
    TicketDetailController()
}
