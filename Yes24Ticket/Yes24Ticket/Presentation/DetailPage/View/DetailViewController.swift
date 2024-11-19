//
//  DetailViewController.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/19/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    let detailHeaderView = DetailHeaderView()
    let someTableView = UIView()
    let wholeView = UIView()
    
    var resultDTO: Concert?
    
    override func loadView() {
        self.view = wholeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultDTO = API()
        if let result = resultDTO {            
            detailHeaderView.fetchData(with: result)
        }
    }
    
    func API() -> Concert {
        return Concert.dummyData()
    }
}

