//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 13/01/2025.
//

import UIKit

class HabitViewController: UIViewController {
    
    let habitView = HabitView()
    
    private(set) lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.backgroundColor = UIColor(named: "NavigationBarBackground")
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeButtontapped))
        closeButton.tintColor = .purple
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtontapped))
        saveButton.tintColor = .purple
        let navItem = UINavigationItem(title: NSLocalizedString("add_new_habit", comment: ""))
        navItem.leftBarButtonItem = closeButton
        navItem.rightBarButtonItem = saveButton
        navBar.setItems([navItem], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(navigationBar)
        let navigationBarConstraints = [
            navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ]
        NSLayoutConstraint.activate(navigationBarConstraints)
        
        habitView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(habitView)
        let habitViewConstraints = [
            habitView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            habitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(habitViewConstraints)
        
        // Where it should be? In ViewController or in UIView? Feels like in UIView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(colorImageTapped(gesture:)))
        habitView.colorImageView.addGestureRecognizer(tapGesture)
        habitView.colorImageView.isUserInteractionEnabled = true
    }
    
    @objc private func closeButtontapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtontapped() {
        print("save button tapped")
        
        let newHabit = Habit(name: "\(habitView.nameTextField.text ?? "привычка без названия")",
                             date: habitView.selectedTime,
                             color: habitView.selectedcolor)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        
        let parent = self.presentationController?.presentingViewController
        parent?.viewWillAppear(false)
        
        dismiss(animated: true)
    }
    
    @objc func colorImageTapped(gesture: UIGestureRecognizer) {
            if (gesture.view as? UIImageView) != nil {
                let colorvc = UIColorPickerViewController()
                colorvc.delegate = self
                present(colorvc, animated: true)
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("colorPickerViewControllerDidFinish")
        habitView.selectedcolor = viewController.selectedColor
    }
}
