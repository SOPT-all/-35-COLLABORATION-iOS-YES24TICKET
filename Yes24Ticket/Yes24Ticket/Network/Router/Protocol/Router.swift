//
//  Router.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import Alamofire
import Foundation

protocol Router: URLRequestConvertible {
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var encoding: ParameterEncoding? { get }
    
}

extension Router {
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw RouterError.invalidURL
        }
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        if let encoding = encoding {
            do {
                return try encoding.encode(request, with: parameters)
            } catch {
                throw RouterError.encoding
            }
        }
        
        return request
    }
    
}
