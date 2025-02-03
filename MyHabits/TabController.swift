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
        tabBar.tintColor = .purple
        tabBar.unselectedItemTintColor = UIColor(resource: .tabBarInactive)
        tabBar.backgroundColor = UIColor(resource: .tabBarBackground)
        setupTabs()
    }
    
    private func setupTabs() {
        let habits = createNav(with: NSLocalizedString("habits_tabbar", comment: ""), and: UIImage(resource: .habitsGlyph), vc: HabitsViewController())
        let info = createNav(with: NSLocalizedString("info_tabbar_title", comment: ""), and: UIImage(resource: .infoGlyph), vc: InfoViewController())
        
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
