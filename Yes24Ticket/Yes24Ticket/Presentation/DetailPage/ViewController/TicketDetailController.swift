//
//  TicketDetailController.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class TicketDetailController: UIViewController {
    
    private let apiService = APIService()
    
    private lazy var ticketDetailView = UITableView(
        frame: .zero,
        style: .grouped
    ).then {
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = UITableView.automaticDimension
        $0.register(
            DetailHeaderView.self,
            forHeaderFooterViewReuseIdentifier: DetailHeaderView.identifier
        )
        $0.register(
            TableViewFooter.self,
            forHeaderFooterViewReuseIdentifier: TableViewFooter.identifier
        )
        $0.register(
            DetailTableViewCell.self,
            forCellReuseIdentifier: DetailTableViewCell.identifier
        )
    }
    
    private lazy var reservationButton = UIButton().then {
        $0.setTitle(
            "예매하기",
            for: .normal
        )
        $0.setTitleColor(
            .white0,
            for: .normal
        )
        $0.backgroundColor = .red100
        $0.addTarget(
            self,
            action: #selector(reservationButtonTapped),
            for: .touchUpInside
        )
        $0.titleLabel?.font = UIFont.customFont(.button_eb_18)
    }
    
    private let buttonBackgroundView = UIView().then {
        $0.backgroundColor = .white0
    }
    
    private let id: Int
    
    private var configuration: ConcertConfiguration?
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        reservationButton.addBorders(
            edges: [.all],
            color: .red200,
            width: 1
        )
        buttonBackgroundView.addBorders(
            edges: [.top],
            color: .gray200,
            width: 1
        )
    }
    
    private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        ticketDetailView.separatorStyle = .none
    }
    
    private func setUI() {
        [
            ticketDetailView,
            buttonBackgroundView
        ].forEach(view.addSubview)
        buttonBackgroundView.addSubview(reservationButton)
    }
    
    private func setLayout() {
        ticketDetailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        buttonBackgroundView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(71)
        }
        
        reservationButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    private func reservationButtonTapped() {
        navigationController?.pushViewController(
            DatePickViewController(id: id),
            animated: true
        )
    }
    
    private func fetchData() {
        apiService.fetchTicketDetail(id: id) { [weak self] result in
            switch result {
            case .success(let modelWithURL):
                self?.apiService.fetchImage(from: modelWithURL.imageURL) { [weak self] imageData in
                    if let imageData = imageData,
                        let image = UIImage(data: imageData) {
                        self?.configuration = .init(
                            image: image,
                            title: modelWithURL.title,
                            genre: modelWithURL.genre,
                            date: modelWithURL.date,
                            area: modelWithURL.area,
                            age: modelWithURL.age,
                            duration: modelWithURL.duration,
                            hypertext: modelWithURL.hypertext,
                            hyperlink: modelWithURL.hyperlink,
                            notice: modelWithURL.notice,
                            performanceTime: modelWithURL.performanceTime,
                            pricing: modelWithURL.pricing
                        )
                        self?.ticketDetailView.reloadData()
                    }
                }
            case .failure(let failure):
                dump(failure)
            }
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
            withIdentifier: DetailTableViewCell.identifier,
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
        if indexPath.row == 0 && isExpanded {
            return 161 + 45
        }
        
        return 45
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailHeaderView.identifier
        ) as? DetailHeaderView else {
            return nil
        }
        if let configuration = configuration {
            header.configure(with: configuration)
        } else {
            header.configure(with: ConcertConfiguration.mockData)
        }
        header.popViewControllerDelegate = self
        
        return header
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 422
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: TableViewFooter.identifier
        ) as? TableViewFooter else {
            return nil
        }
        
        return footer
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        return 179
    }
    
}

extension TicketDetailController: PopViewControllerDelegate {
    
    func popFromNavigationController() {
        navigationController?.popViewController(animated: true)
    }
    
}
