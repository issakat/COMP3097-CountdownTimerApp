//
//  SplashScreen.swift
//  CountdownTimerApp
//
//  Created by Kate Labis on 2025-03-06.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            HomeScreen()
            } else {
                VStack {
                    Text("Countdown Timer App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true
                    }
                }
            }
        }
    }
    
