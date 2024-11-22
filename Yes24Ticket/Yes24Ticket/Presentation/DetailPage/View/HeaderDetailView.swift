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
    
    private let gradientImageView = UIImageView().then {
        $0.image = .whiteGd
    }
    
    private let showTypeBackgroundView = UIView().then {
        $0.backgroundColor = .red100
        $0.layer.cornerRadius = 2
    }
    
    private let showTypeText = UILabel().then {
        $0.text = "단독"
        $0.textColor = .white0
        $0.font = UIFont.customFont(.caption_b_10)
        $0.textAlignment = .center
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
        $0.backgroundColor = .black0
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
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .blue100
        configuration.image = UIImage(resource: .icArrowRightBlue16)
        configuration.imagePlacement = .trailing
        let title = "YES24 LIVE HALL"
        let attributedString = AttributedString(
            title,
            attributes: AttributeContainer([.font: UIFont.customFont(.body_b_13)])
        )
        configuration.attributedTitle = attributedString
        $0.configuration = configuration
        $0.contentHorizontalAlignment = .leading
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
    
    private let dividerView = UIView().then {
        $0.backgroundColor = .gray200
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
        [
            gradientImageView,
            showTypeBackgroundView,
            showTitle,
            dividerView,
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
        
        showTypeBackgroundView.addSubview(showTypeText)
    }
    
    private func setLayout() {
        gradientImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        showTypeBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.leading.equalToSuperview().offset(10)
        }
        
        showTypeText.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(3)
            $0.horizontalEdges.equalToSuperview().inset(4)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(showTypeBackgroundView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        showTitle.snp.makeConstraints {
            $0.leading.equalTo(showTypeBackgroundView.snp.trailing).offset(8)
            $0.centerY.equalTo(showTypeBackgroundView)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        showImage.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(18)
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
            $0.leading.equalTo(genreLabel.snp.trailing).offset(34)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        dateValue.snp.makeConstraints {
            $0.centerY.equalTo(dateLabel)
            $0.leading.equalTo(genreValue)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        locationValue.snp.makeConstraints {
            $0.centerY.equalTo(locationLabel)
            $0.leading.equalTo(genreValue).offset(-12)
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        ageValue.snp.makeConstraints {
            $0.centerY.equalTo(ageLabel)
            $0.leading.equalTo(genreValue)
        }
        
        durationLabel.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(6)
            $0.leading.equalTo(genreLabel)
        }
        
        durationValue.snp.makeConstraints {
            $0.centerY.equalTo(durationLabel)
            $0.leading.equalTo(genreValue)
        }
    }
    
    func configure(with configuration: ConcertConfiguration) {
        showTypeText.text = configuration.genre
        showTitle.text = configuration.title
        showImage.image = configuration.image
        genreValue.text = configuration.genre
        dateValue.text = configuration.date
        locationValue.setTitle(
            "\(configuration.area)",
            for: .normal
        )
        ageValue.text = configuration.age
        durationValue.text = configuration.duration
    }
    
}
