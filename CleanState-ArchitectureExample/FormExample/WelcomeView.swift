//
//  File.swift
//  CleanState-ArchitectureExample
//
//  Created by Michał Wójtowicz on 28/12/2020.
//

import SwiftUI

struct WelcomeView: View {
    let message: String
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            Text(message)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}
