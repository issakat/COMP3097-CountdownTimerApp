//
//  TimerRunningScreen.swift
//  CountdownTimerApp
//
//  Created by Kate Labis on 2025-03-06.
//

import SwiftUI
import AVFoundation

struct TimerRunningScreen: View {
    @Binding var countdownTime: Int
    @State private var timerActive = true
    @State private var remainingTime: Int
    @State private var timer: Timer?
    
    init(countdownTime: Binding<Int>) {
        _countdownTime = countdownTime
        _remainingTime = State(initialValue: countdownTime.wrappedValue)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text(timeString(from: remainingTime))
                .font(.system(size: 40, weight: .bold, design: .monospaced))
            
            Button(timerActive ? "Pause" : "Resume") {
                if timerActive {
                    pauseTimer()
                } else {
                    resumeTimer()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Button("Reset") {
                resetTimer()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            if remainingTime == 0 {
                Text("Time's Up!")
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            NavigationLink("Go Back to Home", destination: HomeScreen())
                .padding()
        }
        .onAppear {
            remainingTime = countdownTime
            startTimer()
        }
        .onDisappear() {
            timer?.invalidate()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer?.invalidate()
            }
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timerActive = false
    }
    
    func resumeTimer() {
        startTimer()
        timerActive = true
    }
    
    func resetTimer() {
        remainingTime = countdownTime
        startTimer()
        timerActive = true
    }
    
    func timeString(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 60)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
