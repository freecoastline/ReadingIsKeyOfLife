//
//  BookViewController.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/5/29.
//

import Foundation
import IGListKit

class BookViewController: UIViewController {
    private lazy var bookCollectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
        return collectionView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
