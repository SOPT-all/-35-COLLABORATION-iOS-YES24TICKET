//
//  DetailViewModel.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/20/24.
//

import Foundation

struct Concert {
    let image: String
    let title: String
    let genre: String
    let date: String
    let area: String
    let age: String
    let duration: String
    let hypertext: String
    let hyperlink: String
    let notice: [String]
    let performenceTime: [String]
    let pricing: [Ticket]
}

struct Ticket {
    let type: String
    let price: String
    let color: Int
}
