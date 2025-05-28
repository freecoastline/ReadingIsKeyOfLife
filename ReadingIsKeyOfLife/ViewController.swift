//
//  ViewController.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/5/18.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bookTab = UITab(title: "Book", image: UIImage.init(systemName: "book.fill"), identifier: "book") { _ in
            let bookViewController = BookViewController()
            bookViewController.view.frame = CGRect(x: 0, y: 0, width: 400, height: 700)
            bookViewController.view.backgroundColor = .white
            return bookViewController
        }
        let statisticsTab = UITab(title: "statistics", image: UIImage.init(systemName: "receipt"), identifier: "statistics") { _ in
            let bookViewController = UITableViewController()
            bookViewController.view.frame = CGRect(x: 0, y: 0, width: 400, height: 700)
            bookViewController.view.backgroundColor = .white
            return bookViewController
        }
        let tabbarController = UITabBarController(tabs: [bookTab, statisticsTab])
        self.addChild(tabbarController)
        self.view.addSubview(tabbarController.view)
    }
}

