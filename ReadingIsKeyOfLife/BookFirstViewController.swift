//
//  BookFirstViewController.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/5/31.
//

import Foundation
import UIKit
import IGListKit

class BookFirstViewController:UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var bookCollectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 100, y: 100, width: 200, height: 500), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    private lazy var progressViewModel = BookProgressViewModel()
    
    override func viewDidLoad() {
        let updater = ListAdapterUpdater()
        let listAdapter = ListAdapter(updater: updater, viewController: self)
        listAdapter.collectionView = bookCollectionView
        listAdapter.delegate = self
        listAdapter.dataSource = self
    }
}

extension BookFirstViewController: ListAdapterDelegate {
    func listAdapter(_ listAdapter: ListAdapter, willDisplay object: Any, at index: Int) {
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying object: Any, at index: Int) {
    }
}

extension BookFirstViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [any ListDiffable] {
        progressViewModel.bookProgressModels
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        BookProgressSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
    
    
}
