//
//  DatePickViewController.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/28/24.
//

import UIKit

final class DatePickViewController: UIViewController {
    
    private let apiService = APIService()
    
    private let prevMonthButton = UIButton().then {
        $0.setImage(
            .btnArrowBoxLeftDisabledA,
            for: .normal
        )
    }
    
    private let nextMonthButton = UIButton().then {
        $0.setImage(
            .btnArrowBoxFront,
            for: .normal
        )
    }
    
    private let calendarTitleLabel = UILabel().then {
        $0.text = "2024 .11"
        $0.font = .customFont(.title_sb_22)
        $0.textColor = .gray900
    }
    
    private let weekStackViewBorderView = UIView().then {
        $0.backgroundColor = .gray150
    }
    
    private let weekStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 1
        $0.backgroundColor = .gray150
        let labels = [
            "일",
            "월",
            "화",
            "수",
            "목",
            "금",
            "토"
        ].map { word in
            UILabel().then { label in
                label.backgroundColor = .gray100
                label.text = word
                label.textAlignment = .center
                label.font = .customFont(.title_eb_12)
                if word == "일" {
                    label.textColor = .red100
                } else if word == "토" {
                    label.textColor = .blue200
                } else{
                    label.textColor = .gray700
                }
                label.snp.makeConstraints {
                    $0.width.equalTo(38)
                    $0.height.equalTo(21)
                }
            }
        }
        for label in labels {
            $0.addArrangedSubview(label)
        }
    }
    
    private lazy var calendarCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createFlowLayout()
    ).then {
        $0.backgroundColor = .gray150
        $0.delegate = self
        $0.dataSource = self
        $0.register(
            CalendarCollectionViewCell.self,
            forCellWithReuseIdentifier: CalendarCollectionViewCell.cellIdentifier
        )
    }
    
    private let possibleBadgeView = UIView().then {
        $0.backgroundColor = .blue50
    }
    
    private let possibleLabel = UILabel().then {
        $0.text = "예매가능"
        $0.font = .customFont(.caption_r_10)
        $0.textColor = .gray400
    }
    
    private let chooseBadgeView = UIView().then {
        $0.backgroundColor = .red100
    }
    
    private let choseLabel = UILabel().then {
        $0.text = "선택"
        $0.font = .customFont(.caption_r_10)
        $0.textColor = .gray400
    }
    
    private let seatSelectHeaderView = DatePickTableHeaderView().then {
        $0.isHidden = true
    }
    
    private lazy var seatSelectTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.register(
            DatePickTableViewCell.self,
            forCellReuseIdentifier: DatePickTableViewCell.identifier
        )
        $0.isHidden = true
    }
    
    private var tableViewData: [AvailableTimeConfiguration] = []
    
    private let id: Int
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func fetchData() {
        // TODO: API 연결
        apiService.fetchAvailableDate(id: id) { [weak self] result in
            switch result {
            case .success(let success):
                
                let calendar = Calendar.current
                self?.availableDatesDays = success.dates.map { calendar.component(.day, from: $0) }
                dump(self?.availableDatesDays)
                self?.calendarCollectionView.reloadData()
            case .failure(let failure):
                dump(failure)
            }
        }
    }
    
    private var availableDatesDays: [Int] = []
    
    private func setStyle() {
        
    }
    
    private func setUI() {
        [
            prevMonthButton,
            calendarTitleLabel,
            nextMonthButton,
            weekStackViewBorderView,
            calendarCollectionView,
            possibleBadgeView,
            possibleLabel,
            chooseBadgeView,
            choseLabel,
            seatSelectHeaderView,
            seatSelectTableView
        ].forEach(view.addSubview)
        weekStackViewBorderView.addSubview(weekStackView)
    }
    
    private func setLayout() {
        calendarTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(23.5)
        }
        
        prevMonthButton.snp.makeConstraints {
            $0.trailing.equalTo(calendarTitleLabel.snp.leading).offset(-10)
            $0.centerY.equalTo(calendarTitleLabel)
        }
        
        nextMonthButton.snp.makeConstraints {
            $0.leading.equalTo(calendarTitleLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(calendarTitleLabel)
        }
        
        weekStackViewBorderView.snp.makeConstraints {
            $0.top.equalTo(calendarTitleLabel.snp.bottom).offset(15.5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(38*7 + 8)
            $0.height.equalTo(23)
        }
        
        weekStackView.snp.makeConstraints {
            $0.edges.equalTo(weekStackViewBorderView).inset(1)
        }
        
        calendarCollectionView.snp.makeConstraints {
            $0.top.equalTo(weekStackViewBorderView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(38*7 + 8)
            $0.height.equalTo(36 * 5 + 5)
        }
        
        choseLabel.snp.makeConstraints {
            $0.top.equalTo(calendarCollectionView.snp.bottom).offset(7)
            $0.trailing.equalTo(calendarCollectionView)
        }
        
        chooseBadgeView.snp.makeConstraints {
            $0.centerY.equalTo(choseLabel)
            $0.trailing.equalTo(choseLabel.snp.leading).offset(-3)
            $0.size.equalTo(9)
        }
        
        possibleLabel.snp.makeConstraints {
            $0.centerY.equalTo(choseLabel)
            $0.trailing.equalTo(chooseBadgeView.snp.leading).offset(-7)
        }
        
        possibleBadgeView.snp.makeConstraints {
            $0.centerY.equalTo(choseLabel)
            $0.trailing.equalTo(possibleLabel.snp.leading).offset(-3)
            $0.size.equalTo(9)
        }
        
        seatSelectHeaderView.snp.makeConstraints {
            $0.top.equalTo(possibleLabel.snp.bottom).offset(77.5)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(32)
        }
        
        seatSelectTableView.snp.makeConstraints {
            $0.top.equalTo(seatSelectHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 1,
            bottom: 1,
            right: 1
        )
        
        return layout
    }
    
}

extension DatePickViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: 38,
            height: 36
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 35
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        // TODO: API 호출 결과로 로직 변경
        if indexPath.row >= 5 {
            if availableDatesDays.contains(indexPath.row - 4) {
                cell.configure(day: "\(indexPath.row - 4)", isSelectable: true)
            } else {
                cell.configure(day: "\(indexPath.row - 4)", isSelectable: false)
            }
        } else {
            cell.configure(day: "", isSelectable: false)
        }
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        apiService.fetchRemainSeats(
            concertID: id,
            performanceTime: "2024-11-\(indexPath.row - 4)"
        ) { [weak self] result in
            switch result {
            case .success(let remainSeats):
                self?.tableViewData = remainSeats
                self?.seatSelectHeaderView.isHidden = false
                self?.seatSelectTableView.isHidden = false
                self?.seatSelectTableView.reloadData()
            case .failure(let failure):
                dump(failure)
            }
        }
    }
    
}

extension DatePickViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return tableViewData.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DatePickTableViewCell.identifier,
            for: indexPath
        ) as? DatePickTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(tableViewData[indexPath.row])
        
        return cell
    }
    
}
