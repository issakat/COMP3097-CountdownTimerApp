//
//  HomeScreen.swift
//  CountdownTimerApp
//
//  Created by Kate Labis on 2025-03-06.
//

import SwiftUI

enum CountdownDestination: Hashable {
    case inputTimer
    case timerRunning
}

struct HomeScreen: View {
    @State private var path = NavigationPath()
    @State private var countdownTime = 0
    
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack(spacing: 30) {
                
                Image(systemName: "clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text(timeString(from: countdownTime))
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                
                Button("Set Timer") {
                    print("Set Timer button pressed")
                    path.append(CountdownDestination.inputTimer)
                }
                .buttonStyle(.borderedProminent)
                
                if countdownTime > 0 {
                    Button("Start Timer") {
                        path.append(CountdownDestination.timerRunning)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationDestination(for: CountdownDestination.self) { destination in
                switch destination {
                case .inputTimer:
                    InputTimerScreen(countdownTime: $countdownTime)
                case .timerRunning:
                    TimerRunningScreen(countdownTime: $countdownTime)
                }
            }
            .padding()
        }
    }
    
    func timeString(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 60)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
