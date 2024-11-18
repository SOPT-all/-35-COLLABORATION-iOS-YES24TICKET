//
//  APIService.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import Alamofire
import Foundation

final class APIService {
    
    func example(
        data: String,
        completion: @escaping (Result<String, ExampleError>) -> Void) {
        AF.request(
            DefaultRouter.getExample
        )
        .validate()
        .responseDecodable(of: ResponseExampleDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.unknown))
                return
            }
            switch response.result {
            case .success(let responseDto):
                completion(.success(responseDto.result.data))
            case .failure(let error):
                // TODO: 에러 처리
                completion(.failure(.unknown))
            }
        }
    }
    
}
