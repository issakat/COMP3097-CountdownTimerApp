//
//  InputTimerScreen.swift
//  CountdownTimerApp
//
//  Created by Kate Labis on 2025-03-06.
//

import SwiftUI

struct InputTimerScreen: View {
    @Binding var countdownTime: Int
    @State private var inputTime: String = "00:00:00"
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Set Timer")
                .font(.title)
            
            TextField("Enter time (HH:MM:SS)", text: $inputTime)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numbersAndPunctuation)
            
            Button("Set Timer") {
                countdownTime = convertToSeconds(from: inputTime)
                print("Timer set to: \(countdownTime) seconds")
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            NavigationLink("Go Back") {
                HomeScreen()
            }
        }
        .padding()
    }
    
    func convertToSeconds(from timeString: String) -> Int {
        let components = timeString.split(separator: ":")
        if components.count == 3,
           let hours = Int(components[0]),
           let minutes = Int(components[1]),
           let seconds = Int(components[2]) {
            return (hours * 3600) + (minutes * 60) + seconds
        }
        return 0
    }
}

