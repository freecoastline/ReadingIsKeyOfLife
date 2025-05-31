//
//  BookUnifyViewController.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/5/29.
//

import Foundation
import IGListKit
import SnapKit
import UIKit

class BookUnifyViewController: UIViewController {
    private lazy var segmentControl:UISegmentedControl = {
        let control = UISegmentedControl(items: ["Book", "Shelf", "Set"])
        return control
    }()
    
    private lazy var containerView:UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        view.addSubview(segmentControl)
        segmentControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.layoutSubviews()
        segmentControl.addTarget(self, action: #selector(segmentControlStateChanged(sender:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        updateContainer()
    }
    
    func viewControllers() -> [UIViewController] {
        [BookFirstViewController(), BookSecondViewController(), BookThirdViewController()]
    }
    
    func updateContainer() {
        let viewControllers = viewControllers()

        for (index, viewController) in viewControllers.enumerated() {
            addChild(viewController)
            containerView.addSubview(viewController.view)
            viewController.view.snp.makeConstraints { make in
                make.left.equalTo(containerView.bounds.width * CGFloat(index))
                make.centerY.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalTo(500)
            }
        }
    }
    
    func pageOffset(of index: Int) -> CGPoint {
        CGPoint(x: Double(index) * containerView.bounds.width, y: 0)
    }
    
    @objc
    func segmentControlStateChanged(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        containerView.setContentOffset(pageOffset(of: selectedIndex), animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
