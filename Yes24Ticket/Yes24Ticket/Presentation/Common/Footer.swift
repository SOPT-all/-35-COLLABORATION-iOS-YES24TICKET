//
//  Footer.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class Footer: UIView {
    
    private let firstStackView = UIStackView().then {
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let secondStackView = UIStackView().then {
        $0.spacing = 8
        $0.alignment = .center
    }
    
    private let thirdStackView = UIStackView().then {
        $0.spacing = 9
        $0.alignment = .center
    }
    
    private let fourthStackView = UIStackView().then {
        $0.spacing = 6
        $0.alignment = .center
    }
    
    private let fifthStackView = UIStackView().then {
        $0.spacing = 6
        $0.alignment = .center
    }
    
    private let sixthStackView = UIStackView()
    
    private let lastStackView = UIStackView().then {
        $0.spacing = 24
        $0.alignment = .center
    }
    
    private let serviceLabel = UILabel().then {
        $0.text = "고객센터"
        $0.font = UIFont.customFont(.title_r_12)
        $0.textColor = .gray600
    }
    
    private let numLabel = UILabel().then {
        $0.text = "1544-6399"
        $0.font = UIFont.customFont(.title_b_12)
        $0.textColor = .gray600
    }
    
    private let helpLabel = UILabel().then {
        $0.text = "1:1 문의"
        $0.font = UIFont.customFont(.title_b_12)
        $0.textColor = .gray600
    }
    
    private let dividerImageView = UIImageView().then {
        $0.image = UIImage.divider
        $0.contentMode = .scaleAspectFit
    }
    
    private let pcLabel = UILabel().then {
        $0.text = "PC버전"
        $0.font = UIFont.customFont(.title_b_12)
        $0.textColor = .gray600
    }
    
    private let personalLabel = UILabel().then {
        $0.text = "개인정보 처리방침"
        $0.font = UIFont.customFont(.body_sb_12)
        $0.textColor = .gray800
    }
    
    private let divider2ImageView = UIImageView().then {
        $0.image = UIImage.divider
        $0.contentMode = .scaleAspectFit
    }
    
    private let serviceTermsLabel = UILabel().then {
        $0.text = "이용약관"
        $0.font = UIFont.customFont(.body_sb_12)
        $0.textColor = .gray800
    }
    
    private let leaderLabel = UILabel().then {
        $0.text = "대표 : 김석환, 최세라"
        $0.font = UIFont.customFont(.caption_sb_10)
        $0.textColor = .gray400
    }
    
    private let addressLabel = UILabel().then {
        $0.text = "주소 : 서울시 영등포구 은행로11, 5~6층 (여의도동, 일신빌딩)"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let numberLabel = UILabel().then {
        $0.text = "사업자등록번호 : 229-81-37000"
        $0.font = UIFont.customFont(.caption_sb_10)
        $0.textColor = .gray400
    }
    
    private let divider3ImageView = UIImageView().then {
        $0.image = UIImage.divider
        $0.contentMode = .scaleAspectFit
    }
    
    private let sellLabel = UILabel().then {
        $0.text = "통신판매업신고 : 제2005-02682호"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일 : yes24help@yes24.com"
        $0.font = UIFont.customFont(.caption_sb_10)
        $0.textColor = .gray400
    }
    
    private let divider4ImageView = UIImageView().then {
        $0.image = UIImage.divider
        $0.contentMode = .scaleAspectFit
    }
    
    private let companyLabel = UILabel().then {
        $0.text = "호스팅서비스사업자 : 예스이십사(주)"
        $0.font = UIFont.customFont(.caption_sb_10)
        $0.textColor = .gray400
    }
    
    private let copyrightLabel = UILabel().then {
        $0.text = "Copyright ⓒ YES24 Corp. All Rights Reserved."
        $0.font = UIFont.customFont(.caption_sb_10)
        $0.textColor = .gray400
    }
    
    private let globalLabel = UILabel().then {
        $0.text = "GLOBAL"
        $0.font = UIFont.customFont(.caption_eb_12)
        $0.textColor = .gray600
    }
    
    private let yes24Label = UILabel().then {
        $0.text = "YES24"
        $0.font = UIFont.customFont(.caption_eb_12)
        $0.textColor = .gray600
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        addBorders(
            edges: [.top],
            color: .gray200,
            width: 1
        )
    }
    
    private func setStyle() {
        backgroundColor = .gray50
    }
    
    private func setUI() {
        [
            firstStackView,
            secondStackView,
            thirdStackView,
            fourthStackView,
            fifthStackView,
            sixthStackView,
            lastStackView
        ].forEach {
            addSubview($0)
        }
        
        [
            serviceLabel,
            numLabel,
            helpLabel,
            dividerImageView,
            pcLabel
        ].forEach {
            firstStackView.addArrangedSubview($0)
        }
        
        [
            personalLabel,
            divider2ImageView,
            serviceTermsLabel
        ].forEach {
            secondStackView.addArrangedSubview($0)
        }
        
        [
            leaderLabel,
            addressLabel
        ].forEach {
            thirdStackView.addArrangedSubview($0)
        }
        
        [
            numberLabel,
            divider3ImageView,
            sellLabel
        ].forEach {
            fourthStackView.addArrangedSubview($0)
        }
        
        [
            emailLabel,
            divider4ImageView,
            companyLabel
        ].forEach {
            fifthStackView.addArrangedSubview($0)
        }
        
        sixthStackView.addArrangedSubview(copyrightLabel)
        
        [
            globalLabel,
            yes24Label
        ].forEach {
            lastStackView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        firstStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        
        secondStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(firstStackView.snp.bottom).offset(10)
        }
        
        thirdStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(secondStackView.snp.bottom).offset(6)
        }
        
        fourthStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(thirdStackView.snp.bottom).offset(2)
        }
        
        fifthStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fourthStackView.snp.bottom).offset(2)
        }
        
        sixthStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fifthStackView.snp.bottom).offset(2)
        }
        
        lastStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sixthStackView.snp.bottom).offset(10)
        }
    }
    
}
