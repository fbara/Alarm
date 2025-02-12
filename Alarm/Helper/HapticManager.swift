//
//  HapticManager.swift
//  Alarm
//
//  Created by Frank Bara on 2/12/25.
//

import Foundation
import SwiftUI
import CoreHaptics

struct HapticManager {
    static func triggerSuccessHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    static func triggerSelectHaptic() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}
