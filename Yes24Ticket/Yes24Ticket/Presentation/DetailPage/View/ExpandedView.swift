//
//  ExpandedView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/27/24.
//

import UIKit

import SnapKit
import Then

final class ExpandedView: UIView {
    
    private let firstLabel = UILabel().then {
        $0.text = "※ 본 공연은 네이버 쿠폰이 적용되지 않습니다."
        $0.font = UIFont.customFont(.body_b_12)
        $0.textColor = .gray600
    }
    
    private let secondLabel = UILabel().then {
        $0.text = "※ 본 공연은 YES24공연에서 진행하는 할인쿠폰이벤트 대상에서 제외됩니다."
        $0.font = UIFont.customFont(.body_b_12)
        $0.textColor = .gray600
        $0.numberOfLines = 0
    }
    
    private let thirdLabel = UILabel().then {
        $0.text = "※ 매수제한: 공연별 1인 4매"
        $0.font = UIFont.customFont(.body_b_12)
        $0.textColor = .gray600
        $0.numberOfLines = 0
    }
    
    private let linkLabel = UILabel().then {
        $0.text = "HYPE UP FESTIVAL 바로가기"
        $0.font = UIFont.customFont(.body_b_12)
        $0.textColor = .chipPurple
        $0.textAlignment = .left
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            firstLabel,
            secondLabel,
            thirdLabel,
            linkLabel
        ].forEach(addSubview)
    }
    
    private func setStyle() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(12)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(12)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(12)
        }
        
        linkLabel.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(12)
        }
    }
    
}
