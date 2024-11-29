//
//  DatePickTableViewCell.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/29/24.
//

import UIKit

final class DatePickTableViewCell: UITableViewCell {
    
    private let selectButton = UIButton().then {
        $0.setImage(.selectbtn, for: .normal)
    }
    
    private let ticketTimeLabel = UILabel().then {
        $0.text = "오후 5:30"
        $0.font = UIFont.customFont(.body_m_24)
        $0.textColor = .red100
    }
    
    private lazy var seatCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createCollectionViewLayout()
    ).then {
        $0.delegate = self
        $0.dataSource = self
        $0.register(
            RemainSeatCollectionViewCell.self,
            forCellWithReuseIdentifier: RemainSeatCollectionViewCell.cellIdentifier
        )
        $0.backgroundColor = .gray50
        $0.layer.cornerRadius = 4
    }
    
    private var collectionViewConfiguration: [SeatConfiguration] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            selectButton,
            ticketTimeLabel,
            seatCollectionView
        ].forEach(addSubview)
    }
    
    private func setLayout() {
        selectButton.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(10)
            $0.trailing.equalToSuperview().inset(15.5)
        }
        
        ticketTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15.5)
        }
        
        seatCollectionView.snp.makeConstraints {
            $0.top.equalTo(selectButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(15.5)
            $0.height.equalTo(50)
        }
    }
    
    private func createCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 148, height: 16)
        layout.sectionInset = .init(
            top: 15,
            left: 8,
            bottom: 15,
            right: 8
        )
        
        return layout
    }
    
    func configure(_ configuration: availableTimeConfiguration) {
        ticketTimeLabel.text = configuration.availableTime
        collectionViewConfiguration = configuration.seatAvailability
        seatCollectionView.reloadData()
    }
    
}

extension DatePickTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewConfiguration.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RemainSeatCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RemainSeatCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(
            type: collectionViewConfiguration[indexPath.row].type,
            remaining: collectionViewConfiguration[indexPath.row].remaining
        )
        
        return cell
    }
    
}
