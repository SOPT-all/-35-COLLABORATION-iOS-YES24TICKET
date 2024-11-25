//
//  APIService.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import Alamofire
import Foundation

final class APIService {
    
    func fetchMainSection(
        completion: @escaping (
            Result<[MainCellConfigurationWithURL], APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getMain
        )
        .validate()
        .responseDecodable(of: MainTicketsDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                completion(
                    .success(
                        dto.datas.map(
                            {
                                MainCellConfigurationWithURL(
                                    title: $0.title,
                                    area: $0.area,
                                    date: $0.period,
                                    imageURL: $0.img
                                )
                            }
                        )
                    )
                )
            case .failure(let error):
                completion(.failure(handleError(error)))
            }
        }
    }
    
    func fetchRankSection(
        completion: @escaping (
            Result<[TicketRankCellConfigurationWithURL], APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getRank
        )
        .validate()
        .responseDecodable(of: RankListDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                completion(
                    .success(
                        dto.ranking.map(
                            {
                                TicketRankCellConfigurationWithURL(
                                    imageURL: $0.imgURL,
                                    rank: $0.rank
                                )
                            }
                        )
                    )
                )
            case .failure(let error):
                completion(.failure(handleError(error)))
            }
        }
    }
    
    func fetchAdSection(
        completion: @escaping (
            Result<[AdCellConfigurationWithURL], APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getADs
        )
        .validate()
        .responseDecodable(of: ADsDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                completion(
                    .success(
                        dto.ads.map(
                            {
                                AdCellConfigurationWithURL(
                                    imageURL: $0.adsImg
                                )
                            }
                        )
                    )
                )
            case .failure(let error):
                completion(.failure(handleError(error)))
            }
        }
    }
    
    func fetchWhatsHotSection(
        completion: @escaping (
            Result<[WhatsHotCellConfigurationWithURL], APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getHots
        )
        .validate()
        .responseDecodable(of: WhatsHotTicketsDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                completion(
                    .success(
                        dto.datas.map(
                            {
                                WhatsHotCellConfigurationWithURL(
                                    title: $0.ticketTitle,
                                    area: $0.ticketArea,
                                    date: $0.ticketDate,
                                    comment: $0.comment,
                                    imageURL: $0.imgURL
                                )
                            }
                        )
                    )
                )
            case .failure(let error):
                completion(.failure(handleError(error)))
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

extension APIService {
    
    private func handleError(
        _ error: AFError
    ) -> APIServiceError {
        if let errorCode = error.responseCode {
            switch errorCode {
            case 400:
                return .badRequest
            case 404:
                return .notFound
            case 500:
                return .internalServer
            default:
                return .unknown
            }
        } else {
            return .unknown
        }
    }
    
}
