//
//  BookStringSectionController.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/5/29.
//

import Foundation
import IGListKit
 
class MyCell:UICollectionViewListCell {
    
}

class BookStringSectionController: ListSectionController {
    override func sizeForItem(at index: Int) -> CGSize {
        CGSize(width: 50, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        collectionContext.dequeueReusableCell(of: MyCell.self, for: self, at: index)
    }
}
