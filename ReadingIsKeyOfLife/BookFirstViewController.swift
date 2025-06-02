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
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 100)
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var progressViewModel = BookProgressViewModel()
    
    private lazy var adapter:ListAdapter = {
        let updater = ListAdapterUpdater()
        let listAdapter = ListAdapter(updater: updater, viewController: self)
        listAdapter.collectionView = bookCollectionView
        return listAdapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bookCollectionView)
        adapter.delegate = self
        adapter.dataSource = self
        bookCollectionView.delegate = self
        bookCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension BookFirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
