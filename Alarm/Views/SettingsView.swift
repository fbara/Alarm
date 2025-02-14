//
//  SettingsView.swift
//  Alarm
//
//  Created by Frank Bara on 2/14/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var settings: SettingsViewModel
    @ObservedObject var alarmManager: AlarmManager
    
    
    var body: some View {
        NavigationStack {
            Form {
                // Toggle 12/24-hour time format
                Section(header: Text("Time Format").foregroundColor(.white)) {
                    Toggle("Use 24-Hour Time Format", isOn: $settings.use24HourFormat)
                        .tint(.green)
                }
                
                // Reset all alarms
                Section(header: Text("Alarms").foregroundColor(.white)) {
                    Button {
                        alarmManager.resetAllAlarms()
                        HapticManager.triggerSuccessHaptic()
                    } label: {
                        Text("Reset All Alarms")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle(Text("Settings"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    SettingsView(settings: SettingsViewModel(), alarmManager: AlarmManager())
}
