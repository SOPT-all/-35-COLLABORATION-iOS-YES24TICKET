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
