//
//  DetailHeaderView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class DetailHeaderView: UITableViewHeaderFooterView {
    
    private static let reuseIdentifier: String = "DetailHeaderView"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let gradationView = UIImageView().then {
        $0.image = .whiteGd
    }
    
    private let containerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let ticketDetailView = UIView().then {
        $0.backgroundColor = .gray100
    }
    
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
    
    private lazy var backButton = UIButton().then {
        $0.setImage(
            UIImage(resource: .icnArrowLeft24),
            for: .normal
        )
        $0.addTarget(
            self,
            action: #selector(handleDismiss),
            for: .touchUpInside
        )
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
    
    private let dividerView = UIView().then {
        $0.backgroundColor = .gray200
    }
    
    private let showImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    private let genre = UILabel().then {
        $0.text = "장르"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let date = UILabel().then {
        $0.text = "일시"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let location = UILabel().then {
        $0.text = "장소"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let age = UILabel().then {
        $0.text = "관람등급"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let duration = UILabel().then {
        $0.text = "관람시간"
        $0.textColor = .black0
        $0.font = UIFont.customFont(.body_sb_12)
    }
    
    private let genreValue = UILabel().then {
        $0.text = "콘서트"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    private let dateValue = UILabel().then {
        $0.text = "2024.11.10 ~ 2024.11.10"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    private let locationValue = UIButton().then {
        $0.setTitle(
            "YES24 LIVE HALL ▸",
            for: .normal
        )
        $0.setTitleColor(
            .blue100,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.customFont(.body_b_13)
    }
    
    private let ageValue = UILabel().then {
        $0.text = "7세 이상"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    private let durationValue = UILabel().then {
        $0.text = "총 180분"
        $0.textColor = .gray800
        $0.font = UIFont.customFont(.body_r_13)
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(
            .icHeartGray36,
            for: .normal
        )
        $0.setImage(
            .icHeart36,
            for: .selected
        )
        $0.addTarget(
            self,
            action: #selector(likeButtonTapped),
            for: .touchUpInside
        )
    }
    
    private let likeLabel = UILabel().then {
        $0.text = "162"
        $0.font = UIFont.customFont(.body_b_14)
        $0.textColor = .gray600
    }
    
    private lazy var shareButton = UIButton().then {
        $0.setImage(
            .icIShare36,
            for: .normal
        )
    }
    
    private let bottonDivierView = UIView().then {
        $0.backgroundColor = .gray200
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            imageView,
            gradationView,
            containerView,
            ticketDetailView
        ].forEach {
            contentView.addSubview($0)
        }
        
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
        ].forEach{
            ticketDetailView.addSubview($0)
        }
        
        [
            backButton,
            showTypeBackgroundView,
            showTitle,
            dividerView,
            showImage,
            genre,
            date,
            location,
            age,
            duration,
            genreValue,
            dateValue,
            locationValue,
            ageValue,
            durationValue,
            likeButton,
            likeLabel,
            shareButton,
            bottonDivierView
        ].forEach {
            containerView.addSubview($0)
        }
        
        showTypeBackgroundView.addSubview(showTypeText)
        
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(47)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(268)
        }
        
        gradationView.snp.makeConstraints {
            $0.edges.equalTo(containerView)
        }
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(containerView)
            $0.height.equalTo(containerView)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(24)
        }
        
        showTypeBackgroundView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(10)
        }
        
        showTypeText.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(3)
            $0.horizontalEdges.equalToSuperview().inset(4)
        }
        
        showTitle.snp.makeConstraints {
            $0.leading.equalTo(showTypeBackgroundView.snp.trailing).offset(8)
            $0.centerY.equalTo(showTypeText)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(showTitle.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        showImage.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(140)
        }
        
        genre.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(18)
            $0.leading.equalTo(showImage.snp.trailing).offset(16)
        }
        
        date.snp.makeConstraints {
            $0.top.equalTo(genre.snp.bottom).offset(6)
            $0.leading.equalTo(genre)
        }
        
        location.snp.makeConstraints {
            $0.top.equalTo(date.snp.bottom).offset(6)
            $0.leading.equalTo(genre)
        }
        
        age.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(6)
            $0.leading.equalTo(genre)
        }
        
        duration.snp.makeConstraints {
            $0.top.equalTo(age.snp.bottom).offset(6)
            $0.leading.equalTo(genre)
        }
        
        genreValue.snp.makeConstraints {
            $0.centerY.equalTo(genre.snp.centerY)
            $0.leading.equalTo(genre.snp.leading).offset(54)
        }
        
        dateValue.snp.makeConstraints {
            $0.centerY.equalTo(date.snp.centerY)
            $0.leading.equalTo(genreValue)
        }
        
        locationValue.snp.makeConstraints {
            $0.centerY.equalTo(location.snp.centerY)
            $0.leading.equalTo(genreValue)
        }
        
        ageValue.snp.makeConstraints {
            $0.centerY.equalTo(age.snp.centerY)
            $0.leading.equalTo(genreValue)
        }
        
        durationValue.snp.makeConstraints {
            $0.centerY.equalTo(duration.snp.centerY)
            $0.leading.equalTo(genreValue)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(132)
            $0.trailing.equalTo(likeLabel.snp.leading).offset(-0.43)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(132)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(141.5)
            $0.trailing.equalTo(shareButton.snp.leading).offset(-10)
        }
        
        bottonDivierView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        ticketDetailView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(162)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(14)
        }
        
        standingImage.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        standingLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.centerY.equalTo(standingImage.snp.centerY)
            $0.leading.equalTo(standingImage.snp.trailing).offset(4)
        }
        
        standingPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(43)
            $0.centerY.equalTo(standingImage.snp.centerY)
            $0.leading.equalTo(standingLabel.snp.trailing).offset(33)
        }
        
        pinnedImage.snp.makeConstraints {
            $0.top.equalTo(standingImage.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(10)
        }
        
        pinnedLabel.snp.makeConstraints {
            $0.top.equalTo(standingLabel.snp.bottom).offset(6)
            $0.centerY.equalTo(pinnedImage.snp.centerY)
            $0.leading.equalTo(pinnedImage.snp.trailing).offset(4)
        }
        
        pinnedPriceLabel.snp.makeConstraints {
            $0.top.equalTo(standingPriceLabel.snp.bottom).offset(8)
            $0.centerY.equalTo(pinnedImage.snp.centerY)
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
    
    @objc private func handleDismiss() {
        //TODO: 추 후 dismiss 연결해 줄 예정입니다.
    }
    
    @objc private func likeButtonTapped() {
        //TODO: 추 후 서버로 통신하는 과정 구현해 줄 예정입니다.
        likeButton.isSelected.toggle()
    }
    
}

extension DetailHeaderView {
    
    func fetchData(with model: Concert) {
        self.imageView.image = model.image
        self.showTypeText.text = model.genre
        self.showTitle.text = model.title
        self.showTypeText.text = model.genre
        self.dateValue.text = model.date
        self.locationValue.setTitle(
            "\(model.area) ▸",
            for: .normal
        )
        self.ageValue.text = model.age
        self.durationValue.text = model.duration
        self.standingPriceLabel.text = model.pricing[0].price
        self.pinnedPriceLabel.text = model.pricing[1].price
        self.timeDetailLabel.text = model.performenceTime[0]
    }
    
}

#Preview {
    
    let view = DetailHeaderView().then {
        $0.fetchData(with: .mockData)
    }
    view

}
