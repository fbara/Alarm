//
//  SettingsViewModel.swift
//  Alarm
//
//  Created by Frank Bara on 2/12/25.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    // Toggle for 12/24 hour format
    @Published var use24HourFormat: Bool = false
    
    // Need to persist this setting in UserDefaults
}
