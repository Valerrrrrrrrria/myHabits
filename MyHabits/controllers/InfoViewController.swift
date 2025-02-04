//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 05/12/2024.
//

import UIKit

final class InfoViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(resource: .navigationBarBackground)
        navigationItem.title = NSLocalizedString("info_tabbar_title", comment: "")
        
        let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoView)
        let infoViewConstraints = [
            infoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            infoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            infoView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(infoViewConstraints)
    }
}
