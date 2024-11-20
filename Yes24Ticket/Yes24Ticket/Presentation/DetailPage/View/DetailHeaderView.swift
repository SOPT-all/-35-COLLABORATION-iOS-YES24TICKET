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
    
    private let containerView = UIView().then {
        $0.backgroundColor = .white
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
    }
    
    private func setUI() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(showTypeBackgroundView)
        showTypeBackgroundView.addSubview(showTypeText)
        containerView.addSubview(showTitle)
        containerView.addSubview(dividerView)
        containerView.addSubview(showImage)
        containerView.addSubview(genre)
        containerView.addSubview(date)
        containerView.addSubview(location)
        containerView.addSubview(age)
        containerView.addSubview(duration)

    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(47)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(260)
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
        
        
    }
    
    @objc private func handleDismiss() {
        //TODO: 추 후 dismiss 연결해 줄 예정입니다.
    }
    
}

extension DetailHeaderView {
    
    func fetchData(with model: Concert) {
        self.showTypeText.text = model.genre
    }
    
}

#Preview {
    
    DetailHeaderView()
    
}
