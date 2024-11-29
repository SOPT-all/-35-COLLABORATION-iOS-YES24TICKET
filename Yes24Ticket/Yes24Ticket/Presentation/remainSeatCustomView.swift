//
//  remainSeatCustomView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/29/24.
//

import UIKit

final class remainSeatCustomView: UIView {
    
    private let seatLabel = UILabel().then {
        $0.text = "스탠딩"
        $0.font = UIFont.customFont(.body_m_13)
        $0.textColor = .gray700
    }
    
    private let seatDetailLabel = UILabel().then {
        $0.text = "P석"
        $0.font = UIFont.customFont(.body_m_13)
        $0.textColor = .gray700
    }
    
    private let seatRemainLabel = UILabel().then {
        $0.text = "39석"
        $0.font = UIFont.customFont(.body_m_13)
        $0.textColor = .gray700
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBorders(
            edges: [.bottom],
            color: .gray250,
            width: 1
        )
    }
    
    private func setUI() {
        [
            seatLabel,
            seatDetailLabel,
            seatRemainLabel
        ].forEach(addSubview)
    }
    
    private func setLayout() {
        seatLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        seatDetailLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(seatLabel.snp.trailing).offset(3)
        }
        
        seatRemainLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(seatDetailLabel.snp.trailing).offset(66)
        }
    }
    
}

#Preview {
    let containerView = UIView()
    let view = remainSeatCustomView()
    
    containerView.addSubview(view)
    containerView.backgroundColor = .black
    view.snp.makeConstraints {
        $0.height.equalTo(19)
        $0.width.equalTo(148)
        $0.top.equalTo(containerView).offset(127)
        $0.leading.equalTo(containerView).offset(16)
    }
    
    return containerView
}
