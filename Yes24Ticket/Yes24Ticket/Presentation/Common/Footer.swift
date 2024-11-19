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
    
    private let TopVerticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .center
    }
    
    private let MiddleVerticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 6
        $0.alignment = .center
    }
    
    private let BottomVerticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let LastVerticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 14
        $0.alignment = .center
    }
    
    private let firstTitleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
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
    
    private let vextorImageView = UIImageView().then {
        $0.image = UIImage.vector34
        $0.contentMode = .scaleAspectFit
    }
    
    private let pcLabel = UILabel().then {
        $0.text = "PC버전"
        $0.font = UIFont.customFont(.title_b_12)
        $0.textColor = .gray600
    }
    
    private let secondTitleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let personalLabel = UILabel().then {
        $0.text = "개인정보 처리방침"
        $0.font = UIFont.customFont(.body_sb_12)
        $0.textColor = .gray800
    }
    
    private let vextor2ImageView = UIImageView().then {
        $0.image = UIImage.vector34
        $0.contentMode = .scaleAspectFit
    }
    
    private let serviceTermsLabel = UILabel().then {
        $0.text = "이용약관"
        $0.font = UIFont.customFont(.body_sb_12)
        $0.textColor = .gray800
    }
    
    private let thirdTitleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let leaderLabel = UILabel().then {
        $0.text = "대표 : 김석환, 최세라"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let addressLabel = UILabel().then {
        $0.text = "주소 : 서울시 영등포구 은행로11, 5~6층 (여의도동, 일신빌딩)"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let forthTitleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let numberLabel = UILabel().then {
        $0.text = "사업자등록번호 : 229-81-37000"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let vextor3ImageView = UIImageView().then {
        $0.image = UIImage.vector34
        $0.contentMode = .scaleAspectFit
    }
    
    private let sellLabel = UILabel().then {
        $0.text = "통신판매업신고 : 제2005-02682호"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let fifthTitleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일 : yes24help@yes24.com"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let vextor4ImageView = UIImageView().then {
        $0.image = UIImage.vector34
        $0.contentMode = .scaleAspectFit
    }
    
    private let companyLabel = UILabel().then {
        $0.text = "호스팅서비스사업자 : 예스이십사(주)"
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let sixthTitleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let copyrightLabel = UILabel().then {
        $0.text = "Copyright ⓒ YES24 Corp. All Rights Reserved."
        $0.font = UIFont.customFont(.caption_sb_10 )
        $0.textColor = .gray400
    }
    
    private let lastTitleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private let globalLabel = UILabel().then {
        $0.text = "GLOBAL"
        $0.font = UIFont.customFont(.caption_eb_12 )
        $0.textColor = .gray600
    }
    
    private let yes24Label = UILabel().then {
        $0.text = "YES24"
        $0.font = UIFont.customFont(.caption_eb_12 )
        $0.textColor = .gray600
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        TopVerticalStackView.addArrangedSubview(firstTitleStackView)
        MiddleVerticalStackView.addArrangedSubview(secondTitleStackView)
        MiddleVerticalStackView.addArrangedSubview(thirdTitleStackView)
        BottomVerticalStackView.addArrangedSubview(forthTitleStackView)
        BottomVerticalStackView.addArrangedSubview(fifthTitleStackView)
        LastVerticalStackView.addArrangedSubview(sixthTitleStackView)
        LastVerticalStackView.addArrangedSubview(lastTitleStackView)
        
        addSubview(TopVerticalStackView)
        addSubview(MiddleVerticalStackView)
        addSubview(BottomVerticalStackView)
        addSubview(LastVerticalStackView)
        
        firstTitleStackView.addArrangedSubview(serviceLabel)
        firstTitleStackView.addArrangedSubview(numLabel)
        firstTitleStackView.addArrangedSubview(helpLabel)
        firstTitleStackView.addArrangedSubview(vextorImageView)
        firstTitleStackView.addArrangedSubview(pcLabel)
        firstTitleStackView.setCustomSpacing(7, after: helpLabel)
        firstTitleStackView.setCustomSpacing(7, after: vextorImageView)
        
        secondTitleStackView.addArrangedSubview(personalLabel)
        secondTitleStackView.addArrangedSubview(vextor2ImageView)
        secondTitleStackView.addArrangedSubview(serviceTermsLabel)
        secondTitleStackView.setCustomSpacing(8, after: personalLabel)
        secondTitleStackView.setCustomSpacing(8, after: vextor2ImageView)
        
        thirdTitleStackView.addArrangedSubview(leaderLabel)
        thirdTitleStackView.addArrangedSubview(addressLabel)
        thirdTitleStackView.setCustomSpacing(9, after: leaderLabel)
        
        forthTitleStackView.addArrangedSubview(numberLabel)
        forthTitleStackView.addArrangedSubview(vextor3ImageView)
        forthTitleStackView.addArrangedSubview(sellLabel)
        forthTitleStackView.setCustomSpacing(6, after: numberLabel)
        forthTitleStackView.setCustomSpacing(6, after: vextor3ImageView)
        
        fifthTitleStackView.addArrangedSubview(emailLabel)
        fifthTitleStackView.addArrangedSubview(vextor4ImageView)
        fifthTitleStackView.addArrangedSubview(companyLabel)
        fifthTitleStackView.setCustomSpacing(6, after: emailLabel)
        fifthTitleStackView.setCustomSpacing(6, after: vextor4ImageView)
        
        sixthTitleStackView.addArrangedSubview(copyrightLabel)
        
        lastTitleStackView.addArrangedSubview(globalLabel)
        lastTitleStackView.addArrangedSubview(yes24Label)
        lastTitleStackView.setCustomSpacing(24, after: globalLabel)
        
        TopVerticalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        MiddleVerticalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(TopVerticalStackView.snp.bottom).offset(10)
        }
        BottomVerticalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(MiddleVerticalStackView.snp.bottom).offset(2)
        }
        LastVerticalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(BottomVerticalStackView.snp.bottom).offset(2)
        }
    }
}
