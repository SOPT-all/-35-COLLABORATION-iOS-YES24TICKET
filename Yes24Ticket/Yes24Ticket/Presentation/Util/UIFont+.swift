//
//  UIFont+.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import UIKit

enum AppleSandolGothic {
    
    case head_b_36
    case head_eb_24
    case head_eb_20
    case head_eb_17
    case head_b_15
    
    case title_sb_22
    case title_sb_20
    case title_eb_17
    case title_b_15
    case title_b_13
    case title_eb_12
    case title_b_12
    case title_r_12
    
    case body_m_24
    case body_b_14
    case body_b_13
    case body_r_13
    case body_m_13
    case body_b_12
    case body_sb_12
    
    case button_eb_18
    case button_sb_19
    case button_b_14
    case button_b_13
    case button_r_13
    
    case caption_eb_12
    case caption_b_12
    case caption_r_11
    case caption_m_11
    case caption_sb_10
    case caption_b_10
    case caption_r_10
    
    var size: CGFloat {
        switch self {
        case .head_b_36:
            return 36
        case .head_eb_24:
            return 24
        case .head_eb_20:
            return 20
        case .head_eb_17:
            return 17
        case .head_b_15:
            return 15
        case .title_sb_22:
            return 22
        case .title_sb_20:
            return 20
        case .title_eb_17:
            return 17
        case .title_b_15:
            return 15
        case .title_b_13:
            return 13
        case .title_eb_12:
            return 12
        case .title_b_12:
            return 12
        case .title_r_12:
            return 12
        case .body_m_24:
            return 24
        case .body_b_14:
            return 14
        case .body_b_13:
            return 13
        case .body_r_13:
            return 13
        case .body_m_13:
            return 13
        case .body_b_12:
            return 12
        case .body_sb_12:
            return 12
        case .button_eb_18:
            return 18
        case .button_sb_19:
            return 19
        case .button_b_14:
            return 14
        case .button_b_13:
            return 13
        case .button_r_13:
            return 13
        case .caption_eb_12:
            return 12
        case .caption_b_12:
            return 12
        case .caption_r_11:
            return 11
        case .caption_m_11:
            return 11
        case .caption_sb_10:
            return 10
        case .caption_b_10:
            return 10
        case .caption_r_10:
            return 10
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .head_b_36:
            return 43
        case .head_eb_24:
            return 29
        case .head_eb_20:
            return 20
        case .head_eb_17:
            return 17
        case .head_b_15:
            return 18
        case .title_sb_22:
            return 17
        case .title_sb_20:
            return 17
        case .title_eb_17:
            return 20
        case .title_b_15:
            return 18
        case .title_b_13:
            return 20
        case .title_eb_12:
            return 20
        case .title_b_12:
            return 17
        case .title_r_12:
            return 14
        case .body_m_24:
            return 17
        case .body_b_14:
            return 16
        case .body_b_13:
            return 16
        case .body_r_13:
            return 16
        case .body_m_13:
            return 16
        case .body_b_12:
            return 14
        case .body_sb_12:
            return 14
        case .button_eb_18:
            return 21
        case .button_sb_19:
            return 20
        case .button_b_14:
            return 17
        case .button_b_13:
            return 20
        case .button_r_13:
            return 20
        case .caption_eb_12:
            return 14
        case .caption_b_12:
            return 14
        case .caption_r_11:
            return 13
        case .caption_m_11:
            return 17
        case .caption_sb_10:
            return 12
        case .caption_b_10:
            return 12
        case .caption_r_10:
            return 12
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .head_b_36:
            return 0
        case .head_eb_24:
            return 0
        case .head_eb_20:
            return 0
        case .head_eb_17:
            return 0
        case .head_b_15:
            return 0
        case .title_sb_22:
            return 0
        case .title_sb_20:
            return 0
        case .title_eb_17:
            return 0
        case .title_b_15:
            return 0
        case .title_b_13:
            return 0
        case .title_eb_12:
            return 0.12
        case .title_b_12:
            return -0.25
        case .title_r_12:
            return 0
        case .body_m_24:
            return 0
        case .body_b_14:
            return 0
        case .body_b_13:
            return 0
        case .body_r_13:
            return 0
        case .body_m_13:
            return 0
        case .body_b_12:
            return 0
        case .body_sb_12:
            return 0
        case .button_eb_18:
            return 0
        case .button_sb_19:
            return 0.19
        case .button_b_14:
            return 0
        case .button_b_13:
            return -0.2
        case .button_r_13:
            return -0.2
        case .caption_eb_12:
            return -1
        case .caption_b_12:
            return -0.3
        case .caption_r_11:
            return 0.2
        case .caption_m_11:
            return 0.1
        case .caption_sb_10:
            return 0
        case .caption_b_10:
            return -0.1
        case .caption_r_10:
            return 0
        }
    }
    
    var name: String {
        switch self {
        case
                .head_b_36, .head_b_15, .title_b_15,
                .title_b_13, .title_b_12, .body_b_14,
                .body_b_13, .body_b_12, .button_b_14,
                .button_b_13, .caption_b_12, .caption_m_11,
                .caption_b_10:
            return "AppleSDGothicNeo-Bold"
        case
                .head_eb_24, .head_eb_20, .head_eb_17,
                .title_eb_17, .title_eb_12, .button_eb_18,
                .caption_eb_12:
            return "AppleSDGothicNeoEB00"
        case
                .title_sb_22, .title_sb_20, .body_sb_12,
                .button_sb_19, .caption_sb_10:
            return "AppleSDGothicNeo-SemiBold"
        case
                .body_m_24, .body_m_13, .caption_r_10:
            return "AppleSDGothicNeo-Medium"
        case
                .title_r_12, .body_r_13, .button_r_13,
                .caption_r_11:
            return "AppleSDGothicNeo-Regular"
        }
    }
    
}

extension UIFont {
    
    static func customFont(_ font: AppleSandolGothic) -> UIFont {
        UIFont(name: font.name, size: font.size)!
    }
    
}
