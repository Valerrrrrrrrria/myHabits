//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 05/12/2024.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private var allHabits: [Habit] = []
    
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
        view.backgroundColor = UIColor(resource: .navigationBarBackground)
       
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddButton))
        addButton.tintColor = .purple
        navigationItem.title = NSLocalizedString("habits_tabbar_title", comment: "")
        navigationItem.rightBarButtonItem = addButton
        
        allHabits = HabitsStore.shared.habits
        allHabits.forEach { habit in
            print("\(habit.name) \(habit.trackDates.count)")
        }

        
        collectionView.backgroundColor = UIColor(resource: .lightGray)
        view.addSubview(collectionView)
        let collectioViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(collectioViewConstraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allHabits = HabitsStore.shared.habits
        collectionView.reloadData()
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
        
        let statusViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StatusCollectionViewCell.self), for: indexPath) as! StatusCollectionViewCell
            
        if (indexPath.row == 0) {
            return statusViewCell
        } else {
            let view = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitCollectionViewCell.self), for: indexPath) as! HabitCollectionViewCell
            view.habit = allHabits[indexPath.row - 1]
            view.statusCell = statusViewCell
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item \(indexPath.row)")
        if (indexPath.row == 0) { return }
        let vc = HabitDetailsViewController()
        vc.habit = allHabits[indexPath.row - 1]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
