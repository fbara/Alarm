//
//  EditAlarmView.swift
//  Alarm
//
//  Created by Frank Bara on 2/14/25.
//

import SwiftUI

struct EditAlarmView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var alarmManager: AlarmManager
    @State var alarm: Alarm
    
    // All weekdays
    let weekdays = Alarm.Weekday.allCases
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Alarm Time").foregroundColor(.white)) {
                    // Display time in 12/24-hr format handled outside or just default
                    DatePicker("Select Time", selection: $alarm.time, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                }
                
                Section(header: Text("Label").foregroundColor(.white)) {
                    // Text field to show/edit name of the alarm
                    TextField("Alarm Label", text: $alarm.label)
                        .textInputAutocapitalization(.words)
                }
                
                Section(header: Text("Status").foregroundColor(.white)) {
                    // Toggle if alarm is on or off
                    Toggle("Enable Alarm", isOn: $alarm.isEnabled)
                        .tint(.green)
                }
                
                Section(header: Text("Repeat Days").foregroundColor(.white)) {
                    // Show a toggle for each of the days of the week
                    ForEach(weekdays) { day in
                        Toggle(day.rawValue, isOn: Binding(
                            get: { alarm.repeatDays.contains(day)},
                            set: { isSelected in
                                if isSelected {
                                    alarm.repeatDays.insert(day)
                                } else {
                                    alarm.repeatDays.remove(day)
                                }
                            }
                        ))
                        .tint(.red)
                    }
                }
                
                Section(header: Text("Snooze Duration(minutes)").foregroundColor(.white)) {
                    // Slider
                    Slider(value: $alarm.snoozeDuration, in: 1...30, step: 1) {
                        Text("Snooze Duration")
                    } minimumValueLabel: {
                        Text("1")
                    } maximumValueLabel: {
                        Text("30")
                    }
                    .foregroundStyle(.white)
                    
                    Text("\(Int(alarm.snoozeDuration))")
                        .foregroundStyle(.gray)
                        
                }
                
                Section(header: Text("Alarm Sound").foregroundColor(.white)) {
                    // Picker to allow selection of the sound
                    Picker("Sound", selection: $alarm.sound) {
                        ForEach(Alarm.AlarmSound.allCases) { sound in
                            Text(sound.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Vibration").foregroundColor(.white)) {
                    // Toggle the alarm's vibration off or on
                    Toggle("Enable Vibration", isOn: $alarm.vibrationenabled)
                        .tint(.orange)
                }
                
                Section(header: Text("Alarm Color").foregroundColor(.white)) {
                    // Displays the color picker
                    ColorPicker("Select Color", selection: $alarm.color, supportsOpacity: false)
                }
                
                Section(header: Text("Custom Message").foregroundColor(.white)) {
                    // Text field for entering a custom message
                    TextField("Message", text: $alarm.customMessage)
                }
                
                Section(header: Text("Favorite").foregroundColor(.white)) {
                    Toggle("Mark as Favorite", isOn: $alarm.isFavorite)
                        .tint(.yellow)
                }
            }
            .navigationTitle("Edit Alarm")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        alarmManager.updateAlarm(alarm: alarm)
                        
                        
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        alarmManager.updateAlarm(alarm: alarm)
                        HapticManager.triggerSuccessHaptic()
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    EditAlarmView(
        alarmManager: AlarmManager(),
        alarm: Alarm.init(time: Date(), label: "Test", isEnabled: true)
    )
}
