//
//  ConcertCategoryViewController.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/22/24.
//

import UIKit

final class ConcertCategoryViewController: UIViewController {
    
    private let concertCategoryView = ConcertCategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setupActions()
    }
    
    private func setUI() {
        view.addSubview(concertCategoryView)
    }
    
    private func setLayout() {
        concertCategoryView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupActions() {
        concertCategoryView.filterButton.addTarget(self, action: #selector(showFilterModal), for: .touchUpInside)
    }
    
    @objc private func showFilterModal() {
        let modalViewController = UIViewController().then {
            $0.view.backgroundColor = .white
            $0.modalPresentationStyle = .pageSheet
            $0.modalTransitionStyle = .coverVertical
            if let sheet = $0.sheetPresentationController {
                sheet.detents = [
                    .custom(resolver: { _ in 179 })
                ]
            }
        }
        
        let titleLabel = UILabel().then {
            $0.text = "정렬 순서"
            $0.font = .customFont(.title_b_15)
            $0.textColor = .gray900
        }
        
        let buttonStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 16
        }
        
        let buttons = ["인기순", "랭킹순", "리뷰 많은순", "종료 임박순"].map { title -> UIButton in
            UIButton(type: .system).then {
                $0.setTitle(title, for: .normal)
                $0.setTitleColor(.gray300, for: .normal)
                $0.titleLabel?.font = .customFont(.button_b_13)
                $0.layer.borderColor = UIColor.gray150.cgColor
                $0.layer.borderWidth = 1
                $0.layer.cornerRadius = 4
                $0.addTarget(self, action: #selector(updateFilterButton(_:)), for: .touchUpInside)
            }
        }
        
        buttons.forEach { buttonStackView.addArrangedSubview($0) }
        
        let closeButton = UIButton(type: .system).then {
            $0.setImage(UIImage(named: "icn_x_18"), for: .normal)
            $0.tintColor = .black
            $0.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        }
        
        let contentView = UIView().then {
            $0.addSubview(titleLabel)
            $0.addSubview(buttonStackView)
            $0.addSubview(closeButton)
        }
        
        modalViewController.view.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(14)
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(30)
        }
        
        present(modalViewController, animated: true, completion: nil)
    }
    
    
    @objc private func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func updateFilterButton(_ sender: UIButton) {
        concertCategoryView.filterButton.setTitle(sender.currentTitle, for: .normal)
        concertCategoryView.filterButton.layer.borderColor = UIColor.red100.cgColor
        concertCategoryView.filterButton.setTitleColor(.red100, for: .normal)
        concertCategoryView.filterButton.backgroundColor = .red50
        
        concertCategoryView.filterButton.setImage(UIImage(named: "icn_array_red_18_i"), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
    
}
