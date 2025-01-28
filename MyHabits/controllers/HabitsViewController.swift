//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 05/12/2024.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private var allHabits: [Habit] = []
    
    private(set) lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.backgroundColor = UIColor(named: "NavigationBarBackground")
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddButton))
        addButton.tintColor = .purple
        let navItem = UINavigationItem(title: NSLocalizedString("habits_tabbar_title", comment: ""))
        navItem.rightBarButtonItem = addButton
        navBar.setItems([navItem], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StatusCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: StatusCollectionViewCell.self))
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        allHabits = HabitsStore.shared.habits
        allHabits.forEach { habit in
            print("\(habit.name)")
        }
        
        view.addSubview(navigationBar)
        let navigationBarConstraints = [
            navigationBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ]
        NSLayoutConstraint.activate(navigationBarConstraints)
        
        collectionView.backgroundColor = UIColor(named: "LightGrayColor")
        view.addSubview(collectionView)
        let collectioViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(collectioViewConstraints)
    }
    
    @objc private func pushAddButton() {
        print("PUSH ADD BUTTON")
        let habitvc = HabitViewController()
        present(habitvc, animated: true)
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allHabits.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.row == 0) {
            return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StatusCollectionViewCell.self), for: indexPath) as! StatusCollectionViewCell
        } else {
            let view = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitCollectionViewCell.self), for: indexPath) as! HabitCollectionViewCell
            view.habitNameLabel.text = allHabits[indexPath.row - 1].name
            view.habitTimeLabel.text = allHabits[indexPath.row - 1].dateString
            view.counter = allHabits[indexPath.row - 1].trackDates.count
            
            return view
        }
    }
}
    
    extension HabitsViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width: CGFloat = collectionView.frame.width - 32
            if (indexPath.row == 0) {
                return CGSize(width: width, height: 60)
            } else {
                return CGSize(width: width, height: 130)
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 22, left: 16, bottom: 22, right: 16)
        }
    }
