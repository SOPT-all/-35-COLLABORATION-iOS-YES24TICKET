//
//  ConcertCategoryViewController.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/22/24.
//

import UIKit

final class ConcertCategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let concertCategoryView = ConcertCategoryView()
        view.addSubview(concertCategoryView)
        
        concertCategoryView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}


