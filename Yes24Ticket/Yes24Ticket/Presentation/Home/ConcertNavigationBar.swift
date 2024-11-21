//
//  ConcertNavigationBar.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/22/24.
//

import UIKit

import SnapKit
import Then

final class ConcertNavigationBar: UIView {
    
    private let backButton = UIButton().then {
        $0.setImage(
            UIImage(resource: .icnArrowLeft24),
            for: .normal
        )
        $0.addTarget(
            ConcertNavigationBar.self,
            action: #selector(handleDismiss),
            for: .touchUpInside
        )
    }
    
    @objc private func handleDismiss() {
        // TODO: ViewController에서 dismiss를 호출하거나 NavigationController pop을 연결합니다.
    }
    
    private let concertTitleLabel = UILabel().then {
        $0.text = "콘서트"
        $0.textColor = .gray700
        $0.font = .customFont(.head_b_15)
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
        addSubview(backButton)
        addSubview(concertTitleLabel)
        addBottomBorder(color: .gray200, height: 1)
    }
    
    private func setStyle(){
        backgroundColor = .gray50
    }
    
    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(24)
        }
        
        concertTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}

private extension UIView {
    func addBottomBorder(color: UIColor, height: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        addSubview(border)
        border.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(height)
        }
    }
}
