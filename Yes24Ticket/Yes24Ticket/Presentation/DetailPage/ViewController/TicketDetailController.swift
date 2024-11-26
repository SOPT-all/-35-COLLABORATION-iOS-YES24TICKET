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

final class TicketDetailController: UIViewController {
    
    private let ticketDetailView = UITableView(frame: .zero, style: .grouped)
    private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func configureTableView() {
        ticketDetailView.delegate = self
        ticketDetailView.dataSource = self
        ticketDetailView.rowHeight = UITableView.automaticDimension
        ticketDetailView.register(
            DetailHeaderView.self,
            forHeaderFooterViewReuseIdentifier: DetailHeaderView.reuseIdentifier
        )
        ticketDetailView.register(
            DetailTableViewCell.self,
            forCellReuseIdentifier: reuseIdentifier
        )
    }
    
    
    private func setStyle() {
        ticketDetailView.separatorStyle = .none
    }
    
    private func setUI() {
        view.addSubview(ticketDetailView)
    }
    
    private func setLayout() {
        ticketDetailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(61)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

extension TicketDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return InfoConfiguration.mockData.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: InfoConfiguration.mockData[indexPath.row])
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if indexPath.row == 0 {
            isExpanded.toggle()
            InfoConfiguration.mockData[indexPath.row].isExpanded?.toggle()
            tableView.reloadRows(
                at: [indexPath],
                with: .automatic
            )
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        if isExpanded && indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        return 45
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailHeaderView.reuseIdentifier
        ) as? DetailHeaderView else {
            return nil
        }
        header.configure(with: ConcertConfiguration.mockData)
        return header
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 422
    }
    
}

#Preview {
    TicketDetailController()
}
