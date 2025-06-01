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
        CGSize(width: 100, height: 100)
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
        return cell
    }

    override func numberOfItems() -> Int {
        1
    }
}
