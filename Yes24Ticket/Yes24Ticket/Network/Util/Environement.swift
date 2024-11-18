//
//  Environment.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import Foundation

enum Environment {
    
    static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
    
}
