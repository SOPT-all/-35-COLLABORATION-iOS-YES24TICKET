//
//  CalendarCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/29/24.
//

import UIKit

import FSCalendar

final class CalendarCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .red100 : .blue50
            dayLabel.textColor = isSelected ? .white0 : .black0
        }
    }
    
    private let dayLabel = UILabel().then {
        $0.font = .customFont(.button_sb_19)
        $0.textColor = .black0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .white0
    }
    
    private func setUI() {
        addSubview(dayLabel)
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(selectToggle)
        )
        addGestureRecognizer(gesture)
    }
    
    private func setLayout() {
        dayLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configure(day: String) {
        dayLabel.text = day
    }
    
    @objc private func selectToggle() {
        backgroundColor = backgroundColor == .blue50 ? .red100 : .blue50
        dayLabel.textColor = backgroundColor == .blue50 ? .black0 : .white0
        if isSelected {
            isSelected.toggle()
        }
    }
    
}
