//
//  CategoryTapNavigationBar.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/23/24.
//

import UIKit

import SnapKit

final class CategoryTapNavigationBar: UIView {
    
    private let recommendButton = UIButton().then {
        $0.setTitle("추천공연", for: .normal)
        $0.setTitleColor(.gray700, for: .normal)
        $0.titleLabel?.font = .customFont(.button_b_13)
        $0.isSelected = true
        $0.backgroundColor = .white
    }
    
    private let rankingButton = UIButton().then {
        $0.setTitle("예매랭킹", for: .normal)
        $0.setTitleColor(.gray700, for: .normal)
        $0.titleLabel?.font = .customFont(.button_r_13)
        $0.isSelected = false
        $0.backgroundColor = .gray100
    }
    
    private let listButton = UIButton().then {
        $0.setTitle("전체리스트", for: .normal)
        $0.setTitleColor(.gray700, for: .normal)
        $0.titleLabel?.font = .customFont(.button_r_13)
        $0.isSelected = false
        $0.backgroundColor = .gray100
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recommendButton.addBorders(
            edges: [.top],
            color: .gray200,
            width: 1
        )
        rankingButton.addBorders(
            edges: [
                .top,
                .bottom,
                .left
            ],
            color: .gray200,
            width: 1
        )
        listButton.addBorders(
            edges: [
                .top,
                .bottom,
                .left
            ],
            color: .gray200,
            width: 1
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .white
    }
    
    private func setUI() {
        [recommendButton, rankingButton, listButton].forEach(addSubview)
    }
    
    private func setLayout() {
        recommendButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(3)
        }
        
        rankingButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(recommendButton.snp.trailing)
            $0.width.equalToSuperview().dividedBy(3)
        }
        
        listButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(rankingButton.snp.trailing)
            $0.trailing.equalToSuperview()
        }
    }
    
}
