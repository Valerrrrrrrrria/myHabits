//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 05/12/2024.
//

import UIKit

class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor(named: "LightGrayColor")
        view.backgroundColor = .white
        addNavigationBar(withTittle: "")
    
    }
    
    func addNavigationBar(withTittle: String) {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 44, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)
        
        navBar.backgroundColor = UIColor(named: "NavigationBarBackground")
        let navItem = UINavigationItem()
        let doneItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(showAllert))
        doneItem.tintColor = .purple
        navItem.rightBarButtonItem = doneItem

        navBar.setItems([navItem], animated: false)
    }
    
    @objc func createTask() {
        showAllert()
    }
    
    @objc func showAllert() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
