//
//  UISystem.swift
//  GoGo
//
//  Created by Mathias Erligmann on 07/12/2020.
//

import UIKit

struct UISystem {
    static func getNavigation(rootViewController: UIViewController) -> UINavigationController {
        let navigation = UINavigationController()
        navigation.viewControllers = [rootViewController]
        navigation.navigationBar.prefersLargeTitles = false
        navigation.navigationBar.barTintColor = .backColor
        navigation.navigationBar.tintColor = .mainColor
        return navigation
    }
}
