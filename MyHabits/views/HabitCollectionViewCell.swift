//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Валерия Новикова on 23/01/2025.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    var habit: Habit? {
        didSet {
            habitNameLabel.text = habit?.name
            habitNameLabel.textColor = habit?.color
            habitTimeLabel.text = habit?.dateString
            counterLabel.text = "Счётчик: \(habit?.trackDates.count ?? 0)"
            if (habit?.isAlreadyTakenToday == true) { checkbox.image =  UIImage(systemName: "checkmark.circle.fill") }
            else { checkbox.image =  UIImage(systemName: "circle") }
            checkbox.tintColor = habit?.color
        }
    }
    
    lazy private(set) var habitNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Выпить стакан воды"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private(set) var habitTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Каждый день в 07:30"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private(set) var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "Счётчик: 1"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private(set) var checkbox: UIImageView = {
        let imageview = UIImageView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageview.isUserInteractionEnabled = true
        imageview.addGestureRecognizer(tapGestureRecognizer)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
        
        addSubview(habitNameLabel)
        let habitNameLabelConstraints = [
            habitNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(habitNameLabelConstraints)
        
        addSubview(habitTimeLabel)
        let habitTimeLabelConstraints = [
            habitTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitTimeLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 4)
        ]
        NSLayoutConstraint.activate(habitTimeLabelConstraints)
        
        addSubview(counterLabel)
        let counterLabetConstraints = [
            counterLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            counterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(counterLabetConstraints)
        
        addSubview(checkbox)
        let checkboxConstraints = [
            checkbox.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            checkbox.topAnchor.constraint(equalTo: self.topAnchor, constant: 46),
            checkbox.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -46),
            checkbox.heightAnchor.constraint(equalToConstant: 38),
            checkbox.widthAnchor.constraint(equalToConstant: 38)
        ]
        NSLayoutConstraint.activate(checkboxConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if (habit == nil) { return }
        
        if (habit?.isAlreadyTakenToday == false) {
            checkbox.image =  UIImage(systemName: "checkmark.circle.fill")
            HabitsStore.shared.track(habit!)
            counterLabel.text = "Счётчик: \(habit?.trackDates.count ?? 0)"
        } else {
            checkbox.image =  UIImage(systemName: "circle")
            habit?.trackDates.removeLast()
            counterLabel.text = "Счётчик: \(habit?.trackDates.count ?? 0)"
        }
    }
}
