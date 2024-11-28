//
//  DatePickTableHeaderView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/29/24.
//

import UIKit

final class DatePickTableHeaderView: UIView {
    
    private let selectHeaderLabel = UILabel().then {
        $0.text = "관람시간 선택"
        $0.font = UIFont.customFont(.title_b_13)
        $0.textColor = .gray600
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
        self.backgroundColor = .gray100
    }
    
    private func setUI() {
        addSubview(selectHeaderLabel)
    }
    
    private func setLayout() {
        selectHeaderLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(11)
        }
    }
    
}
