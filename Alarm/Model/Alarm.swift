//
//  Alarm.swift
//  Alarm
//
//  Created by Frank Bara on 2/12/25.
//

import Foundation
import SwiftUI

struct Alarm: Identifiable {
    let id = UUID()
    var time: Date
    var label: String
    var isEnabled: Bool
    var repeatDays: Set<Weekday> = []
    var snoozeDuration: Double = 5
    var sound: AlarmSound = .defaultSound
    var vibrationenabled: Bool = false
    var color: Color = .blue
    var customMessage: String = "Time to wake up!"
    
    
    // Favorite (starred) alarm for pinning to the top
    var isFavorite: Bool = false
    
    enum Weekday: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case monday = "Mon"
        case tuesday = "Tue"
        case wednesday = "Wed"
        case thursday = "Thu"
        case friday = "Fri"
        case saturday = "Sat"
        case sunday = "Sun"
    }
    
    enum AlarmSound: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case defaultSound = "Default"
        case natureSound = "Nature"
        case windChimeSound = "Wind Chime"
        case birds = "Birds"
        case chime = "Chime"
        case waves = "Waves"
    }
    
}
