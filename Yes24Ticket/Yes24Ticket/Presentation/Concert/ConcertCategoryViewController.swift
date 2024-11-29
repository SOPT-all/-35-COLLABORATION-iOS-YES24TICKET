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
        let modalViewController = UIViewController()
        modalViewController.view.backgroundColor = .white
        modalViewController.modalPresentationStyle = .pageSheet
        modalViewController.modalTransitionStyle = .coverVertical
        
        if let sheet = modalViewController.sheetPresentationController {
            sheet.detents = [
                .custom(resolver: { _ in 179 })
            ]
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "정렬 순서"
        titleLabel.font = .customFont(.title_b_15)
        titleLabel.textColor = .gray900
        
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 16
        
        let buttons = ["인기순", "랭킹순", "리뷰 많은순", "종료 임박순"].map { title -> UIButton in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.gray300, for: .normal)
            button.titleLabel?.font = .customFont(.button_b_13)
            button.layer.borderColor = UIColor.gray150.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 4
            
            button.addTarget(self, action: #selector(updateFilterButton(_:)), for: .touchUpInside)
            return button
        }
        
        buttons.forEach { buttonStackView.addArrangedSubview($0) }
        
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(named: "icn_x_18"), for: .normal)
        closeButton.tintColor = .black
        closeButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        let contentView = UIView()
        modalViewController.view.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(buttonStackView)
        contentView.addSubview(closeButton)
        
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
