//
//  HabitsView.swift
//  MyHabits
//
//  Created by Валерия Новикова on 13/01/2025.
//

import UIKit

class HabitsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        print("INIT")
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupViews() {
        
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
