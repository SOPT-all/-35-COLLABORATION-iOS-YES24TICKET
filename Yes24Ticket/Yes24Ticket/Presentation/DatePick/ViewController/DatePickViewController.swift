//
//  DatePickViewController.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/28/24.
//

import UIKit

import FSCalendar

final class DatePickViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        
    }
    
    private func setUI() {
        view.addSubview(calendarCollectionView)
    }
    
    private func setLayout() {
        calendarCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.horizontalEdges.equalToSuperview().inset(51)
            $0.height.equalTo(180+6)
        }
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(
            top: 1,
            left: 1,
            bottom: 1,
            right: 1
        )
        
        return layout
    }
    
}

extension DatePickViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: 40,
            height: 36
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        35
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        // TODO: API 호출 결과로 로직 변경
        if indexPath.row >= 5 {
            cell.configure(day: "\(indexPath.row - 4)")
        }
        if indexPath.row != 14 {
            cell.isUserInteractionEnabled = false
        } else {
            cell.isSelected = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell else {
            return true
        }
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            return false
        } else {
            return true
        }
    }
    
}
