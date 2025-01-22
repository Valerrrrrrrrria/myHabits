//
//  CollectionViewCell.swift
//  MyHabits
//
//  Created by Валерия Новикова on 22/01/2025.
//

import UIKit

class StatusCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
