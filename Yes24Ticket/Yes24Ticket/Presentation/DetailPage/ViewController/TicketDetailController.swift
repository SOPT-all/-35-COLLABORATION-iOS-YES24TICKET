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

    private let ticketDetailView = UITableView()
    private let titles = DetailTableViewTitle.allCases

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
        ticketDetailView.register(
            DetailHeaderView.self,
            forHeaderFooterViewReuseIdentifier: DetailHeaderView.reuseIdentifier
        )
        ticketDetailView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    private func setStyle() {
        ticketDetailView.backgroundColor = .white
    }

    private func setUI() {
        view.addSubview(ticketDetailView)
    }

    private func setLayout() {
        ticketDetailView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(94)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

extension TicketDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = titles[indexPath.row].rawValue
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailHeaderView.reuseIdentifier
        ) as? DetailHeaderView else {
            return nil
        }
        header.configure(with: .mockData)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 425
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}

#Preview {
    TicketDetailController()
}
