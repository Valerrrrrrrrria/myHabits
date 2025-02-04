//
//  HabitView.swift
//  MyHabits
//
//  Created by Валерия Новикова on 13/01/2025.
//

import UIKit

final class HabitView: UIView {
    
    lazy var selectedcolor: UIColor = .orange {
        didSet {
            print("selectedcolor DIDSET")
            colorImageView.tintColor = selectedcolor
        }
    }
    
    lazy var selectedTime: Date = Date.now {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "hh:mm aa"
            scheduleLabel.text = NSLocalizedString("everyday_at", comment: "") + dateFormatter.string(from: selectedTime)
            timePicker.setDate(selectedTime, animated: false)
        }
    }
    
    // MARK: - Subviews
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("habit_title", comment: "").uppercased()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("habit_name_placeholder", comment: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("habit_color", comment: "").uppercased()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var colorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .swatchDot)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("habit_time", comment: "").uppercased()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var scheduleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("everyday_at", comment: "")
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.locale = Locale.init(identifier: "en")
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        return timePicker
    }()
    
    private(set) lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("habit_delete", comment: ""), for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        
        selectedTime = Date.now
        timePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func addViews() {
        addSubview(nameLabel)
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 21)
        ]
        NSLayoutConstraint.activate(nameLabelConstraints)
        
        addSubview(nameTextField)
        let nameTextFieldConstraints = [
            nameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7)
        ]
        NSLayoutConstraint.activate(nameTextFieldConstraints)
        
        addSubview(colorLabel)
        let colorLabelConstraints = [
            colorLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            colorLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(colorLabelConstraints)
        
        addSubview(colorImageView)
        let colorImageConstraints = [
            colorImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorImageView.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7)
        ]
        NSLayoutConstraint.activate(colorImageConstraints)
        
        addSubview(timeLabel)
        let timeLabelConstraints = [
            timeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: colorImageView.bottomAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(timeLabelConstraints)
        
        addSubview(scheduleLabel)
        let scheduleLabelConstraints = [
            scheduleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scheduleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scheduleLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(scheduleLabelConstraints)
        
        addSubview(timePicker)
        let timePickerConstraints = [
            timePicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timePicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            timePicker.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(timePickerConstraints)
        
        addSubview(deleteButton)
        let deleteButtonConstraints = [
            deleteButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            deleteButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            deleteButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(deleteButtonConstraints)
    }
    
    @objc private func dateChanged(sender: UIDatePicker) {
        selectedTime = sender.date
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
