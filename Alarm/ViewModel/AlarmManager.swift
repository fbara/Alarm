//
//  AlarmManager.swift
//  Alarm
//
//  Created by Frank Bara on 2/12/25.
//

import Foundation
import SwiftUI

class AlarmManager: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    // Add a new alarm with default settings
    func addAlarm() {
        let newAlarm = Alarm(time: Date(), label: "New Alarm", isEnabled: true)
        alarms.append(newAlarm)
    }
    
    // Quick add preset alarm
    func quickAddPresetAlarm() {
        var comps = DateComponents()
        comps.hour = 7
        comps.minute = 0
        let calendar = Calendar.current
        let morningDate = calendar.date(from: comps) ?? Date()
        let presetAlarm = Alarm(time: morningDate, label: "7:00 AM", isEnabled: true)
        
        alarms.append(presetAlarm)
    }
    
    // Update an existing alarm
    func updateAlarm(alarm: Alarm) {
        guard let index = alarms.firstIndex(where: { $0.id == alarm.id }) else { return }
        
        alarms[index] = alarm
    }
    
    // Delete alarms at specified offsets
    func deleteAlarms(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
    
    // Duplicat an existing alarm
    func duplicateAlarm(_ alarm: Alarm) {
        var newAlarm = alarm
        newAlarm.isFavorite = false // reset favorite for the duplicate
        newAlarm.label += " (Copy)"
        newAlarm.isEnabled = false // duplicate alarm is disabled by default
        
        alarms.append(newAlarm)
    }
    
    // Reset all alarms to their defaults
    func resetAllAlarms() {
        alarms.removeAll()
        addAlarm() // add a default alarm
    }
}
