//
//  TicketDetailView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/22/24.
//

import UIKit

import SnapKit
import Then

final class TicketDetailView: UIView {
    
    private let priceLabel = UILabel().then {
        $0.text = "티켓등급별 가격"
        $0.font = UIFont.customFont(.title_b_15)
        $0.textColor = .blue100
    }
    
    private let standingImage = UIImageView().then {
        $0.image = UIImage.icSitMint18
        $0.contentMode = .scaleAspectFit
    }
    
    private let standingLabel = UILabel().then {
        $0.text = "스탠딩석"
        $0.textColor = .gray700
        $0.font = UIFont.customFont(.body_b_12)
    }
    
    private let standingPriceLabel = UILabel().then {
        $0.text = "132,000원"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_b_12)
    }
    
    private let pinnedImage = UIImageView().then {
        $0.image = UIImage.icSitBlue18
        $0.contentMode = .scaleAspectFit
    }
    
    private let pinnedLabel = UILabel().then {
        $0.text = "지정석"
        $0.textColor = .gray700
        $0.font = UIFont.customFont(.body_b_12)
    }
    
    private let pinnedPriceLabel = UILabel().then {
        $0.text = "132,000원"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_b_12)
    }
    
    private let performanceTimeLabel = UILabel().then {
        $0.text = "공연시간"
        $0.textColor = .blue100
        $0.font = UIFont.customFont(.title_b_15)
    }
    
    private let timeDetailLabel = UILabel().then {
        $0.font = UIFont.customFont(.body_m_13)
        $0.textColor = .gray700
        $0.text = "2024년 11월 10일(일) 5시 30분"
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
            priceLabel,
            standingImage,
            standingLabel,
            standingPriceLabel,
            pinnedImage,
            pinnedLabel,
            pinnedPriceLabel,
            performanceTimeLabel,
            timeDetailLabel
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setStyle() {
        self.backgroundColor = .gray100
    }
    
    private func setLayout() {
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(14)
        }
        
        standingImage.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        standingLabel.snp.makeConstraints {
            $0.centerY.equalTo(standingImage)
            $0.leading.equalTo(standingImage.snp.trailing).offset(4)
        }
        
        standingPriceLabel.snp.makeConstraints {
            $0.centerY.equalTo(standingImage)
            $0.leading.equalTo(standingLabel.snp.trailing).offset(33)
        }
        
        pinnedImage.snp.makeConstraints {
            $0.top.equalTo(standingImage.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(10)
        }
        
        pinnedLabel.snp.makeConstraints {
            $0.centerY.equalTo(pinnedImage)
            $0.leading.equalTo(pinnedImage.snp.trailing).offset(4)
        }
        
        pinnedPriceLabel.snp.makeConstraints {
            $0.centerY.equalTo(pinnedImage)
            $0.leading.equalTo(pinnedLabel.snp.trailing).offset(43)
        }
        
        performanceTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(103)
            $0.leading.equalToSuperview().offset(14)
        }
        
        timeDetailLabel.snp.makeConstraints {
            $0.top.equalTo(performanceTimeLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(14)
        }
        
    }
    
    func configure(with configuration: ConcertConfiguration) {
        standingPriceLabel.text = configuration.pricing[0].price
        pinnedPriceLabel.text = configuration.pricing[1].price
        timeDetailLabel.text = configuration.performanceTime[0]
    }
    
}
