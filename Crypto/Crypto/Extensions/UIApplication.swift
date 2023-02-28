//
//  UIApplication.swift
//  Crypto
//
//  Created by Al-Amin on 2023/02/27.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
