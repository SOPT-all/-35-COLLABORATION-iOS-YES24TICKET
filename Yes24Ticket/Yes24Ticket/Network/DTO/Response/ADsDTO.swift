//
//  ADsDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/25/24.
//

struct ADsDTO: Decodable {
    
    let result: String
    let ads: [ADDTO]
    
}

struct ADDTO: Decodable {
    
    let adsID: Int
    let adsImg: String

    enum CodingKeys: String, CodingKey {
        
        case adsID = "ads_id"
        case adsImg = "ads_img"
        
    }
    
}
