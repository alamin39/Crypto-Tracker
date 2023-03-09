//
//  String.swift
//  Crypto
//
//  Created by Al-Amin on 2023/03/10.
//

import Foundation

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
