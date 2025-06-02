//
//  BookProgressSectionController.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/1.
//

import Foundation
import IGListKit

class BookProgressSectionController:ListSectionController {
    var currentBook:BookProgressModel?
    override func didUpdate(to object: Any) {
        guard let object = object as? BookProgressModel else {
            return
        }
        currentBook = object
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext.dequeueReusableCell(of: BookProgressCell.self, for: self, at: index)
        guard let currentBook else {
            return UICollectionViewCell()
        }
        guard let cell = cell as? BookProgressCell else {
            return UICollectionViewCell()
        }
        cell.update(with: currentBook)
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }

    override func numberOfItems() -> Int {
        10
    }
}
