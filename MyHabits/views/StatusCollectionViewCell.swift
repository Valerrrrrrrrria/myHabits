//
//  CollectionViewCell.swift
//  MyHabits
//
//  Created by Валерия Новикова on 22/01/2025.
//

import UIKit

final class StatusCollectionViewCell: UICollectionViewCell {
    
    private var progress : Float = 0.0
    
    // MARK: - Subviews
    
    private(set) lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("status_title", comment: "")
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.tintColor = .purple
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    // MARK: - Lifecycle
    
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
        
        addSubview(percentLabel)
        let procentLabelConstraints = [
            percentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            percentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            percentLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        NSLayoutConstraint.activate(procentLabelConstraints)
        
        addSubview(progressView)
        let progressViewConstraints = [
            progressView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            progressView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(progressViewConstraints)
    }
    
    func updateProgress(progress: Float) {
        progressView.progress = progress
        percentLabel.text = "\(((progress ) * 100).rounded())%"
        // Do not understant why I can't update it
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
