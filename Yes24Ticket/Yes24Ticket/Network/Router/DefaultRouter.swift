//
//  DefaultRouter.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import Alamofire
import Foundation

enum DefaultRouter {
    
    case getMain
    case getRank
    case getADs
    case getHots
    case getConcert(dto: ConcertRequestDTO)
    case getAvailableDate(id: Int)
    case getRemainTickets(dto: RequestRemainTicketsDTO)
    
}

extension DefaultRouter: Router {
    
    var baseURL: String {
        Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .getMain:
            "/tickets/main"
        case .getRank:
            "/tickets/ranked"
        case .getADs:
            "/ads"
        case .getHots:
            "/tickets/hot"
        case .getConcert:
            "/tickets/list"
        case .getAvailableDate(let id):
            "/tickets/availableDate/\(id)"
        case .getRemainTickets:
            "/tickets/availableTimeSlots"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMain:
                .get
        case .getRank:
                .get
        case .getADs:
                .get
        case .getHots:
                .get
        case .getConcert:
                .get
        case .getAvailableDate:
                .get
        case .getRemainTickets:
                .post
        }
    }
    
    var headers: [String : String] {
        switch self {
        default:
            [
                "Content-Type": "application/json"
            ]
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .getMain:
            [:]
        case .getRank:
            [:]
        case .getADs:
            [:]
        case .getHots:
            [:]
        case .getConcert(let dto):
            dto.asDictionary()
        case .getAvailableDate:
            [:]
        case .getRemainTickets(let dto):
            dto.asDictionary()
        }
    }
    
    var encoding: (any ParameterEncoding)? {
        switch self {
        case .getConcert:
            URLEncoding.default
        case .getRemainTickets:
            JSONEncoding.default
        default:
            nil
        }
    }
    
}
