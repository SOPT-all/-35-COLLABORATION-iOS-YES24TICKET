//
//  HeaderDetailView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/22/24.
//

import UIKit

import SnapKit
import Then

final class HeaderDetailView: UIView {
    
    private let backgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = .whiteGd
    }
    
    private let showTitle = UILabel().then {
        $0.text = "HYPE UP FESTIVAL"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.head_eb_20)
        $0.numberOfLines = 0
    }
    
    private let showImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    private let genreLabel = UILabel().then {
        $0.text = "장르"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let genreValue = UILabel().then {
        $0.text = "콘서트"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "일시"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let dateValue = UILabel().then {
        $0.text = "2024.11.10 ~ 2024.11.10"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    private let locationLabel = UILabel().then {
        $0.text = "장소"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let locationValue = UIButton().then {
        $0.setTitle("YES24 LIVE HALL ▸", for: .normal)
        $0.setTitleColor(.blue100, for: .normal)
        $0.titleLabel?.font = UIFont.customFont(.body_b_13)
    }
    
    private let ageLabel = UILabel().then {
        $0.text = "관람등급"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let ageValue = UILabel().then {
        $0.text = "7세 이상"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    private let durationLabel = UILabel().then {
        $0.text = "관람시간"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let durationValue = UILabel().then {
        $0.text = "총 180분"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(backgroundImageView)
        
        [
            showTitle,
            showImage,
            genreLabel,
            genreValue,
            dateLabel,
            dateValue,
            locationLabel,
            locationValue,
            ageLabel,
            ageValue,
            durationLabel,
            durationValue
        ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        
        showTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        showImage.snp.makeConstraints {
            $0.top.equalTo(showTitle.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(140)
        }
        
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(showImage.snp.top)
            $0.leading.equalTo(showImage.snp.trailing).offset(16)
        }
        
        genreValue.snp.makeConstraints {
            $0.centerY.equalTo(genreLabel)
            $0.leading.equalTo(genreLabel.snp.trailing).offset(10)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        dateValue.snp.makeConstraints {
            $0.centerY.equalTo(dateLabel)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(10)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        locationValue.snp.makeConstraints {
            $0.centerY.equalTo(locationLabel)
            $0.leading.equalTo(locationLabel.snp.trailing).offset(10)
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        ageValue.snp.makeConstraints {
            $0.centerY.equalTo(ageLabel)
            $0.leading.equalTo(ageLabel.snp.trailing).offset(10)
        }
        
        durationLabel.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        durationValue.snp.makeConstraints {
            $0.centerY.equalTo(durationLabel)
            $0.leading.equalTo(durationLabel.snp.trailing).offset(10)
        }
    }
    
    func configure(with model: Concert) {
        showTitle.text = model.title
        showImage.image = model.image
        genreValue.text = model.genre
        dateValue.text = model.date
        locationValue.setTitle(
            "\(model.area) ▸",
            for: .normal
        )
        ageValue.text = model.age
        durationValue.text = model.duration
    }
}

#Preview {
    let view = HeaderDetailView().then {
        $0.configure(with: .mockData)
    }
    view
}
