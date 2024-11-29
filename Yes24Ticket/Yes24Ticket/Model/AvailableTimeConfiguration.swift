//
//  AvailableTimeConfiguration.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/29/24.
//

import UIKit

struct AvailableTimeConfiguration {
    
    let availableTime: String
    let seatAvailability: [SeatConfiguration]
    
}

struct SeatConfiguration {
    
    let type: String
    let remaining: String
    
}

//extension AvailableTimeConfiguration {
//
//    static let mockData: [AvailableTimeConfiguration] = [
//        .init(
//            date: "2024-11-20",
//            availableTime: "오후 13:00",
//            seatAvailability: [
//                .init(
//                    type: "R석",
//                    remaining: "3"
//                ),
//                .init(
//                    type: "S석",
//                    remaining: "0"
//                )
//            ]
//        ),
//        .init(
//            date: "2024-11-21",
//            availableTime: "오후 16:00",
//            seatAvailability: [
//                .init(
//                    type: "R석",
//                    remaining: "2"
//                ),
//                .init(
//                    type: "S석",
//                    remaining: "1"
//                )
//            ]
//        )
//    ]
//}
//
//extension SeatConfiguration {
//    
//    static let mockData: [SeatConfiguration] = [
//        .init(
//            type: "R석",
//            remaining: "5"
//        ),
//        .init(
//            type: "S석",
//            remaining: "4"
//        )
//    ]
//    
//}
