//
//  InfoView.swift
//  MyHabits
//
//  Created by Валерия Новикова on 07/01/2025.
//

import UIKit

class InfoView: UIView {
    
    private(set) lazy var scroolView = UIScrollView()
    private(set) lazy var scroolViewContainer = UIView()
    
    private(set) lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.backgroundColor = UIColor(named: "NavigationBarBackground")
        let navItem = UINavigationItem(title: NSLocalizedString("info_tabbar_title", comment: ""))
        navBar.setItems([navItem], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = NSLocalizedString("info_title", comment: "")
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private(set) lazy var bodyLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = NSLocalizedString("info_body", comment: "")
        textLabel.font = UIFont.systemFont(ofSize: 17)
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(navigationBar)
        let navigationBarConstraints = [
            navigationBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 0),
            navigationBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            navigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -44) // todo: fix it
        ]
        NSLayoutConstraint.activate(navigationBarConstraints)
        
        scroolView.translatesAutoresizingMaskIntoConstraints = false
        scroolView.alwaysBounceVertical = true
        addSubview(scroolView)
        let scroolViewConstraints = [
            scroolView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scroolView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scroolView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            scroolView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(scroolViewConstraints)
        
        scroolViewContainer.translatesAutoresizingMaskIntoConstraints = false
        scroolView.addSubview(scroolViewContainer)
        let scroolViewContainerConstraints = [
            scroolViewContainer.leadingAnchor.constraint(equalTo: scroolView.leadingAnchor),
            scroolViewContainer.trailingAnchor.constraint(equalTo: scroolView.trailingAnchor),
            scroolViewContainer.topAnchor.constraint(equalTo: scroolView.topAnchor),
            scroolViewContainer.widthAnchor.constraint(equalTo: scroolView.widthAnchor),
            scroolViewContainer.bottomAnchor.constraint(equalTo: scroolView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(scroolViewContainerConstraints)
        
        scroolViewContainer.addSubview(titleLabel)
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: scroolViewContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: scroolViewContainer.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: scroolViewContainer.topAnchor, constant: 22)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        scroolViewContainer.addSubview(bodyLabel)
        let bodyLabelConstraints = [
            bodyLabel.leadingAnchor.constraint(equalTo: scroolViewContainer.leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: scroolViewContainer.trailingAnchor, constant: -16),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            bodyLabel.bottomAnchor.constraint(equalTo: scroolViewContainer.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(bodyLabelConstraints)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
