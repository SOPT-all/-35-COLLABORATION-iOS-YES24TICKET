//
//  ConcertDTO.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/29/24.
//

struct ConcertDTO: Decodable {
    let results: [ConcertData]

    struct ConcertData: Decodable {
        let title: String
        let area: String
        let period: String
        let imgURL: String?
    }
}
