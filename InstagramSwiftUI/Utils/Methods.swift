//
//  Methods.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/26.
//


import SwiftUI

struct FormFocusManager<Field: Hashable> {
    
    let order: [Field]
    
    func next(after current: Field?) -> Field? {
        guard
            let current,
            let index = order.firstIndex(of: current),
            index + 1 < order.count
        else {
            return nil
        }
        return order[index + 1]
    }
    
    var isLast: (Field?) -> Bool {
        { field in
            guard let field,
                  let index = order.firstIndex(of: field)
            else { return true }
            return index == order.count - 1
        }
    }
}

func notificationText(
    userName: String,
    actionText: String
) -> AttributedString {
    
    var name = AttributedString(userName)
    name.font = .system(size: 14, weight: .semibold)
    
    var content = AttributedString(" " + actionText)
    content.font = .system(size: 15)
    
    return name + content
}

