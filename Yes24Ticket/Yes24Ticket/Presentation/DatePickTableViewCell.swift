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
    
    private let seatBackgroundView = UIView().then {
        $0.backgroundColor = .gray50
        $0.layer.cornerRadius = 4
    }
    
    private let seatStackView =  UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 38
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
    }
    
    private func setLayout() {
        
    }
    
    
    
}
