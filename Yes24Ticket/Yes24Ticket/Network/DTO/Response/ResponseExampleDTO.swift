//
//  ResponseExampleDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

struct ResponseExampleDTO: Decodable {
    
    let result: ResponseExampleDataDTO
    
}

struct ResponseExampleDataDTO: Decodable {
    
    let data: String
    
}
