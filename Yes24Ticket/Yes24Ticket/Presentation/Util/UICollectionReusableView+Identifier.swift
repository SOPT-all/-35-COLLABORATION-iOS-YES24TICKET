//
//  UICollectionReusableView+Identifier.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/20/24.
//

import UIKit

extension UICollectionReusableView {
    
    static var reusableViewIdentifier: String {
        String(describing: self)
    }
    
}
