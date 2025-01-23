//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Валерия Новикова on 23/01/2025.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
