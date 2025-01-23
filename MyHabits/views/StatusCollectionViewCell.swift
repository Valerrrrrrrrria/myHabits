//
//  CollectionViewCell.swift
//  MyHabits
//
//  Created by Валерия Новикова on 22/01/2025.
//

import UIKit

class StatusCollectionViewCell: UICollectionViewCell {
    
    lazy private(set) var statusLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("status_title", comment: "")
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private(set) var procentLabel: UILabel = {
        let label = UILabel()
        label.text = "50%"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private(set) var progressVew: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0.5
        progress.tintColor = .purple
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
        
        addSubview(statusLabel)
        let labelConstraints = [
            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            statusLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        
        addSubview(procentLabel)
        let procentLabelConstraints = [
            procentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            procentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            procentLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        NSLayoutConstraint.activate(procentLabelConstraints)
        
        addSubview(progressVew)
        let progressViewConstraints = [
            progressVew.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            progressVew.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            progressVew.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            progressVew.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(progressViewConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
