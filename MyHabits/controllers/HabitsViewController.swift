//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 05/12/2024.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private(set) lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.backgroundColor = UIColor(named: "NavigationBarBackground")
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddButton))
        let navItem = UINavigationItem(title: NSLocalizedString("habits_tabbar_title", comment: ""))
        navItem.rightBarButtonItem = addButton
        navBar.setItems([navItem], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(navigationBar)
        let navigationBarConstraints = [
            navigationBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ]
        NSLayoutConstraint.activate(navigationBarConstraints)

//        let habitView = HabitsView()
//        habitView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(habitView)
//        let habitViewConstraints = [
//            habitView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            habitView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            habitView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            habitView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
//        ]
//        NSLayoutConstraint.activate(habitViewConstraints)
    }
    
    @objc private func pushAddButton() {
        print("PUSH ADD BUTTON")
        let habitvc = HabitViewController()
        present(habitvc, animated: true)
        //navigationController?.pushViewController(habitvc, animated: true)
    }
}
