//
//  DetailTableViewCell.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class DetailTableViewCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let identifier: String = "DetailTableViewCell"
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.customFont(.title_b_15)
        $0.textColor = .gray700
    }
    
    private let dottedLineView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let detailLabel = UILabel().then {
        $0.font = UIFont.customFont(.body_b_12)
        $0.textColor = .gray600
        $0.numberOfLines = 0
        $0.isHidden = true
    }
    
    private let linkLabel = UILabel().then {
        $0.text = "HYPE UP FESTIVAL 바로가기"
        $0.font = UIFont.customFont(.body_b_12)
        $0.textColor = .blue
        $0.isHidden = true
        $0.textAlignment = .left
        $0.isUserInteractionEnabled = true
    }
    
    private let arrowImageView = UIImageView().then {
        $0.image = .icArrowRight16
    }
    
    private let seperatorView = UIView().then {
        $0.backgroundColor = .gray200
    }
    
    private var detailLabelHeightConstraint: Constraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        setStyle()
        setUI()
        setLayout()
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
    }
    
    private func addDottedLine(to view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.gray200.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [4, 2]
        shapeLayer.fillColor = nil
        shapeLayer.frame = view.bounds
        shapeLayer.path = UIBezierPath(rect: view.bounds).cgPath
        view.layer.addSublayer(shapeLayer)
    }
    
    private func setStyle() {
        selectionStyle = .none
    }
    
    private func setUI() {
        [
            titleLabel,
            detailLabel,
            arrowImageView,
            seperatorView,
            detailLabel,
            linkLabel
        ].forEach { contentView.addSubview($0) }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13.5)
            $0.leading.equalToSuperview().offset(10)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.horizontalEdges.equalTo(titleLabel)
            $0.bottom.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13.5)
            $0.trailing.equalToSuperview().inset(7)
            $0.width.height.equalTo(16)
        }
        
        seperatorView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func configure(with data: InfoConfiguration, isExpanded: Bool) {
        titleLabel.text = data.title
        detailLabel.text = data.details
        detailLabel.isHidden = !isExpanded
        if titleLabel.text == "알립니다" {
            arrowImageView.image = isExpanded ? .icArrowUp16 : .icArrowDown16
            linkLabel.isHidden = !isExpanded
            dottedLineView.isHidden = !isExpanded
            
            // 점선 적용
            if isExpanded {
                addDottedLine(to: dottedLineView)
            } else {
                dottedLineView.layer.sublayers?.removeAll() // 점선 제거
            }
        } else {
            arrowImageView.image = .icArrowRight16
            linkLabel.isHidden = true
            dottedLineView.isHidden = true
        }
    }
    
}
