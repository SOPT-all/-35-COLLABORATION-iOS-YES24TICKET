//
//  AttributedString+.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/18/24.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    static func customString(
        _ text: String,
        font: AppleSandolGothic
    ) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = font.spacing
        paragraphStyle.minimumLineHeight = font.lineHeight
        paragraphStyle.maximumLineHeight = font.lineHeight
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.customFont(font)
        ]
        
        return NSAttributedString(
            string: text,
            attributes: attributes
        )
    }
    
}
