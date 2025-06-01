//
//  bookProgressModel.swift
//  ReadingIsKeyOfLife
//
//  Created by ken on 2025/6/1.
//

import Foundation
import UIKit
import IGListKit

enum BookType {
    case analog
    case electric
}

class BookProgressModel:ListDiffable {
    func diffIdentifier() -> any NSObjectProtocol {
        bookName as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: (any ListDiffable)?) -> Bool {
        guard let object = object as? BookProgressModel else {
            return true
        }
        return object.bookName == self.bookName
    }
    
    let bookName:String = "tianlongbabu"
    let currentPage:Int = 0
    let pageCount:Int = 0
    var coverImage:UIImage?
    var bookType:BookType?
    let author:String = "ken.wu"
}
