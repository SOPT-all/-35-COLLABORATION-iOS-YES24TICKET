//
//  ConcertCategoryViewController.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/22/24.
//

import UIKit

final class ConcertCategoryViewController: UIViewController {
    
    private lazy var concertCategoryView = ConcertCategoryView().then {
        $0.popViewControllerDelegate = self
    }
    
    weak var navigationControllerDelegate: TabBarNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationControllerDelegate?.searchBarChange()
    }
    
    private func setUI() {
        view.addSubview(concertCategoryView)
    }
    
    private func setLayout(){
        concertCategoryView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension ConcertCategoryViewController: PopViewControllerDelegate {
    
    func popFromNavigationController() {
        navigationController?.popViewController(animated: true)
        navigationControllerDelegate?.searchBarChange()
    }
    
}
