//
//  UIApplication+Utils.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/25.
//

import UIKit

extension UIApplication {
    
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
