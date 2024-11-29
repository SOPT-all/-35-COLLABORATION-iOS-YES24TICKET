//
//  DatePicViewCustomNav.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/29/24.
//

import UIKit

final class DatePicViewCustomNav: UIView {
    
    weak var popViewControllerDelegate: PopViewControllerDelegate?
    
    private let leftImageView = UIImageView().then {
        $0.image = UIImage(resource: .union)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setImage(
            .icnArrowLeft24,
            for: .normal
        )
        $0.addTarget(
            self,
            action: #selector(backButtonTapped),
            for: .touchUpInside
        )
    }
    
    private lazy var closeButton = UIButton().then {
        $0.setImage(
            .icnError24I,
            for: .normal
        )
        $0.addTarget(
            self,
            action: #selector(closeButtonTapped),
            for: .touchUpInside
        )
    }
    
    private let registerLabel = UILabel().then {
        $0.text = "예매하기"
        $0.font = UIFont.customFont(.title_b_15)
        $0.textColor = .coolgray50
    }
    
    private let dateSelectLabel = UILabel().then {
        $0.text = "날짜/시간 선택"
        $0.font = UIFont.customFont(.head_eb_17)
        $0.textColor = .white0
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
        self.backgroundColor = .coolgray100
    }
    
    private func setUI() {
        [
            leftImageView,
            backButton,
            closeButton,
            registerLabel,
            dateSelectLabel
        ].forEach(addSubview)
    }
    
    private func setLayout() {
        leftImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
        
        registerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalTo(backButton.snp.trailing).offset(60)
        }
        
        dateSelectLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.trailing.equalTo(closeButton.snp.trailing).inset(62)
        }
    }
    
    @objc private func backButtonTapped() {
        popViewControllerDelegate?.popFromNavigationController()
    }
    
    @objc private func closeButtonTapped() {
        popViewControllerDelegate?.popFromNavigationController()
    }
    
}
