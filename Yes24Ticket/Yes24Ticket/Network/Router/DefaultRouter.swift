//
//  DefaultRouter.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import Alamofire
import Foundation

enum DefaultRouter {
    
    case postExample(dto: RequestExampleDTO)
    case getExample
    
}

extension DefaultRouter: Router {
    
    var baseURL: String {
        Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .postExample:
            "/example"
        case .getExample:
            "/get/example"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .postExample:
                .post
        case .getExample:
                .get
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
        case .postExample(let dto):
            return dto.asDictionary()
        case .getExample:
            return [:]
        }
    }
    
    var encoding: (any ParameterEncoding)? {
        switch self {
        case .postExample:
            JSONEncoding.default
        case .getExample:
            URLEncoding.default
        }
    }
    
}
