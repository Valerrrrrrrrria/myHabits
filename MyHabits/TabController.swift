//
//  TabController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 06/12/2024.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBackground
        tabBar.tintColor = .purple
        tabBar.unselectedItemTintColor = UIColor(named: "TabBarInactive")
        tabBar.backgroundColor = UIColor(named: "TabBarBackground")
        setupTabs()
    }
    
    private func setupTabs() {
        let habits = createNav(with: "Привычки", and: UIImage(named: "habits_glyph"), vc: HabitsViewController())
        let info = createNav(with: "Информация", and: UIImage(named: "info_glyph"), vc: InfoViewController())
        
        self.setViewControllers([habits, info], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
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
