//
//  ConcertCategoryViewController.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/22/24.
//

import UIKit

import Alamofire

final class ConcertCategoryViewController: UIViewController {
    
    private lazy var concertCategoryView = ConcertCategoryView().then {
        $0.popViewControllerDelegate = self
        $0.pushViewControllerDelegate = self
    }
    
    weak var navigationControllerDelegate: TabBarNavigationControllerDelegate?
  
    private var currentSortKey: ConcertSortCase?
    
    private let apiService = APIService()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        requestConcertsWithSortKey()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationControllerDelegate?.searchBarClose()
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
        
        switch title {
        case "인기순":
            currentSortKey = .popular
        case "랭킹순":
            currentSortKey = .ranking
        case "리뷰 많은순":
            currentSortKey = .reviews
        case "종료 임박순":
            currentSortKey = .endingSoon
        default:
            break
        }
        
        requestConcertsWithSortKey()
    }
    
    private func requestConcertsWithSortKey() {
        apiService.fetchConcert(
            sort: currentSortKey
        ) { [weak self] response in
                switch response {
                case .success(let concerts):
                    dump(concerts)
                    self?.updateFilterButtonUI()
                    self?.concertCategoryView.updateConcerts(concerts)
                case .failure(let failure):
                    dump(failure)
                }
            }
        
    }
    
    private func updateFilterButtonUI() {
        let selectedTitle: String
        switch currentSortKey {
        case .popular:
            selectedTitle = "인기순"
        case .ranking:
            selectedTitle = "랭킹순"
        case .reviews:
            selectedTitle = "리뷰 많은순"
        case .endingSoon:
            selectedTitle = "종료 임박순"
        default:
            return
        }
        
        concertCategoryView.filterButton.setTitle(selectedTitle, for: .normal)
        concertCategoryView.filterButton.layer.borderColor = UIColor.red100.cgColor
        concertCategoryView.filterButton.setTitleColor(.red100, for: .normal)
        concertCategoryView.filterButton.backgroundColor = .red50
        concertCategoryView.filterButton.setImage(UIImage(named: "icn_array_red_18_i"), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension ConcertCategoryViewController: PopViewControllerDelegate, PushViewControllerDelegate {
    
    func popFromNavigationController() {
        navigationController?.popViewController(animated: true)
    }
    
    func pushViewController(id: Int) {
        navigationController?.pushViewController(
            DatePickViewController(id: id),
            animated: true
        )
    }
    
}
