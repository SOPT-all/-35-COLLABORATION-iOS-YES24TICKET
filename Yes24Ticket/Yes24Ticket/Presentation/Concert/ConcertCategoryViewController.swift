//
//  ConcertCategoryViewController.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/22/24.
//

import UIKit

import Alamofire

final class ConcertCategoryViewController: UIViewController {
    
    private let concertCategoryView = ConcertCategoryView()
    private var currentSortKey: String? 
    
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
                sheet.detents = [.custom(resolver: { _ in 179 })]
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
                $0.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
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
    
    @objc private func filterButtonTapped(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        
        let sortKey: String
        switch title {
        case "인기순": sortKey = "popular"
        case "랭킹순": sortKey = "ranking"
        case "리뷰 많은순": sortKey = "reviews"
        case "종료 임박순": sortKey = "endingSoon"
        default: return
        }
        
        if currentSortKey == sortKey {
        } else {
            currentSortKey = sortKey
        }
        
        requestConcertsWithSortKey(sortKey)
    }
    
    private func requestConcertsWithSortKey(_ sortKey: String) {
        let urlString = "https://api.example.com/tickets/list?sortBy=\(sortKey)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: ConcertDTO.self) { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let dto):
                    let concerts = dto.results.map {
                        Concert(
                            imageURL: $0.imgURL,
                            title: $0.title,
                            subtitle: $0.area,
                            date: $0.period
                        )
                    }
                    DispatchQueue.main.async {
                        self.concertCategoryView.updateConcerts(concerts)
                    }
                case .failure(let error):
                    if let data = response.data {
                        print("API Response Failure with data: \(String(data: data, encoding: .utf8) ?? "No data")")
                    }
                    print("Error: \(error)")
                }
            }
        
        updateFilterButtonUI(for: sortKey)
    }
    
    private func updateFilterButtonUI(for sortKey: String) {
        let selectedTitle: String
        switch sortKey {
        case "popular": selectedTitle = "인기순"
        case "ranking": selectedTitle = "랭킹순"
        case "reviews": selectedTitle = "리뷰 많은순"
        case "endingSoon": selectedTitle = "종료 임박순"
        default: return
        }
        
        concertCategoryView.filterButton.setTitle(selectedTitle, for: .normal)
        concertCategoryView.filterButton.layer.borderColor = UIColor.red100.cgColor
        concertCategoryView.filterButton.setTitleColor(.red100, for: .normal)
        concertCategoryView.filterButton.backgroundColor = .red50
        concertCategoryView.filterButton.setImage(UIImage(named: "icn_array_red_18_i"), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
