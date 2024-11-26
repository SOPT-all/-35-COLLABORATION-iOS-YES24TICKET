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
    
    private let dottedLayer = CAShapeLayer().then {
        $0.strokeColor = UIColor.gray200.cgColor
        $0.lineWidth = 1
        $0.lineDashPattern = [4, 2]
        $0.fillColor = nil
    }
    
    private let dottedLineView = UIView().then {
        $0.backgroundColor = .clear
        $0.isHidden = true
    }
    
    private let detailLabel = UILabel().then {
        $0.font = UIFont.customFont(.body_b_12)
        $0.textColor = .gray600
        $0.numberOfLines = 0
        $0.isHidden = true
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
        
        dottedLayer.frame = dottedLineView.bounds
        dottedLineView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        let path = UIBezierPath()
        path.move(
            to: CGPoint(
                x: 0,
                y: dottedLineView.bounds.height / 2
            )
        )
        path.addLine(
            to: CGPoint(
                x: dottedLineView.bounds.width,
                y: dottedLineView.bounds.height / 2
            )
        )
        
        dottedLineView.layer.addSublayer(dottedLayer)
        dottedLayer.path = path.cgPath
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
            dottedLineView
        ].forEach {
            contentView.addSubview($0)
        }
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
        
        dottedLineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13.5)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func configure(with data: InfoConfiguration) {
        titleLabel.text = data.title
        if let isExpanded = data.isExpanded {
            detailLabel.text = data.details
            arrowImageView.image = isExpanded ? .icArrowUp16 : .icArrowDown16
            [
                detailLabel,
                dottedLineView
            ].forEach {
                $0.isHidden = !isExpanded
            }
        } else {
            dottedLineView.isHidden = true
            arrowImageView.image = .icArrowRight16
        }
    }
    
}
