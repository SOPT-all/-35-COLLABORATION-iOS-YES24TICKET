//
//  ConcertModel.swift
//  Toss
//
//  Created by 어진 on 11/27/24.
//

import Foundation
import UIKit

struct Concert {
    
    let image: UIImage?
    let title: String
    let subtitle: String
    let date: String
    
}

struct MockData {
    
    static let concerts: [Concert] = [
        
        Concert(
            image: UIImage(named: "kim"),
            title: "이무진 전국투어 콘서트",
            subtitle: "대구, 청원",
            date: "2024. 12. 07 - 12. 08"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "김나영 연말 콘서트",
            subtitle: "서울, 코엑스",
            date: "2024. 12. 15 - 12. 16"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "아이유 단독 콘서트",
            subtitle: "부산, 해운대",
            date: "2024. 12. 21 - 12. 22"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "트와이스 크리스마스 콘서트",
            subtitle: "인천, 아레나",
            date: "2024. 12. 25 - 12. 26"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "박효신 전국투어",
            subtitle: "대전, 예술의 전당",
            date: "2025. 01. 05 - 01. 06"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "뉴진스 팬미팅",
            subtitle: "서울, 잠실",
            date: "2025. 01. 10 - 01. 11"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "잔나비 크리스마스 콘서트",
            subtitle: "제주, 공연장",
            date: "2024. 12. 28 - 12. 29"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "세븐틴 전국투어 콘서트",
            subtitle: "대구, 청원",
            date: "2024. 12. 07 - 12. 08"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "엑소 단독 콘서트",
            subtitle: "광주, 공연장",
            date: "2025. 01. 15 - 01. 16"
        ),
        Concert(
            image: UIImage(named: "kim"),
            title: "블랙핑크 전국투어 콘서트",
            subtitle: "서울, 고척돔",
            date: "2025. 01. 20 - 01. 21"
        )
    ]
}
