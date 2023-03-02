//
//  HapticManager.swift
//  Crypto
//
//  Created by Al-Amin on 2023/03/02.
//

import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
