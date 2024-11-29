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
                                    id: $0.ticketID,
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
                dump(error)
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
                                    id: $0.ticketID,
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
                                    id: $0.adsID,
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
                                    id: $0.ticketID,
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
    
    func fetchConcert(
        sort: ConcertSortCase?,
        completion: @escaping (
            Result<[Concert], APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getConcert(dto: ConcertRequestDTO(sortBy: sort))
        )
        .validate()
        .responseDecodable(of: ConcertsDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                completion(
                    .success(
                        dto.concerts.map(
                            {
                                Concert(
                                    id: $0.concertID,
                                    imageURL: $0.concertImg,
                                    title: $0.concertTitle,
                                    area: $0.concertArea,
                                    date: $0.concertDate
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
    
    func fetchAvailableDate(
        id: Int,
        completion: @escaping (
            Result<AvailableDates, APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getAvailableDate(id: id)
        )
        .validate()
        .responseDecodable(of: AvailableDateDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                
                if let id = Int(dto.concertID) {
                       completion(
                        .success(
                            .init(
                                id: id,
                                dates: dto.performanceTimes.compactMap({ formatter.date(from: $0) })
                            )
                        )
                       )
                   } else {
                       
                   }
            case .failure(let error):
                completion(.failure(handleError(error)))
            }
        }
    }
    
    func fetchRemainSeats(
        concertID: Int,
        performanceTime: String,
        completion: @escaping (
            Result<[AvailableTimeConfiguration], APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getRemainTickets(
                dto: RequestRemainTicketsDTO(
                    concertID: "\(concertID)",
                    performanceTime: performanceTime
                )
            )
        )
        .validate()
        .responseDecodable(of: RemainTicketsDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                completion(
                    .success(
                        dto.data.map(
                            {
                                AvailableTimeConfiguration(
                                    availableTime: $0.performanceTime,
                                    seatAvailability: $0.remainingSeats.map {
                                        .init(
                                            type: $0.type,
                                            remaining: $0.remaining
                                        )
                                    }
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
    
    func fetchTicketDetail(
        id: Int,
        completion: @escaping (
            Result<ConcertConfigurationWithURL, APIServiceError>
        ) -> Void
    ) {
        AF.request(
            DefaultRouter.getTicketDetail(id: id)
        )
        .validate()
        .responseDecodable(of: TicketDetailDTO.self) { [weak self] response in
            guard let self else {
                completion(.failure(.deallocated))
                return
            }
            
            switch response.result {
            case .success(let dto):
                completion(
                    .success(
                        .init(
                            imageURL: dto.concert.concertImg,
                            title: dto.concert.concertTitle,
                            genre: "단독",
                            date: dto.concert.concertDate,
                            area: dto.concert.concertArea,
                            age: dto.concert.concertAge,
                            duration: dto.concert.concertDuration,
                            hypertext: dto.concert.hypertext,
                            hyperlink: dto.concert.hyperlink,
                            notice: dto.concert.notice,
                            performanceTime: dto.concert.performanceTimes,
                            pricing: dto.concert.ticketPricing.map {
                                .init(
                                    type: $0.type,
                                    price: $0.price,
                                    color: Int($0.color)!
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
        completion: @escaping (Data?) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    dump(error)
                    completion(nil)
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
