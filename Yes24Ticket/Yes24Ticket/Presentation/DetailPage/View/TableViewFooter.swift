//
//  TableViewFooter.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/27/24.
//

import UIKit

final class TableViewFooter: UITableViewHeaderFooterView {
    
    static let identifier = "TableViewFooter"
    
    private let footer = Footer()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(footer)
    }
    
    private func setLayout() {
        footer.snp.makeConstraints {
            $0.height.equalTo(179)
            $0.top.horizontalEdges.equalToSuperview()
        }
    }
    
}

#Preview
{
    TableViewFooter()
}
