//
//  shoppingItem.swift
//  RealmKakeibo
//
//  Created by 御前政喜 on 2023/08/14.
//

import Foundation
import RealmSwift

class ShoppingItem: Object{
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
    @Persisted var category: Category?
    
    
}
