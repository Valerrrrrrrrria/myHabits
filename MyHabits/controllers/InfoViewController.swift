//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 05/12/2024.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addNavigationBar(withTittle: "Информация")
        addAppInfo(withTitle: NSLocalizedString("info_title", comment: ""), withBody: NSLocalizedString("info_body", comment: ""))
    }
    
    func addNavigationBar(withTittle title: String) {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 44, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)
        
        navBar.backgroundColor = UIColor(named: "NavigationBarBackground")
        let navItem = UINavigationItem(title: title)

        navBar.setItems([navItem], animated: false)
    }
    
    func addAppInfo(withTitle title: String, withBody body: String) {
        let titleTextView = UITextView(frame: CGRect(x: 16, y: 88 + 22, width: view.frame.size.width, height: 24))
        titleTextView.text = title
        
        let bodyTextView = UITextView(frame: CGRect(x: 16, y: 88 + 62, width: view.frame.size.width - 16, height: view.frame.size.height))
        bodyTextView.text = body
        
        view.addSubview(titleTextView)
        view.addSubview(bodyTextView)
    }
    
}
