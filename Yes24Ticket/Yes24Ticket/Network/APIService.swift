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
    
    func fetchImage(
            from urlString: String,
            completion: @escaping (Result<Data, ExampleError>) -> Void
        ) {
            guard let url = URL(string: urlString) else {
                completion(.failure(.wrongPath))
                return
            }
            
            AF.request(url)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        print("error: \(error.localizedDescription)")
                        completion(.failure(.unknown))
                    }
                }
        }
    
}
