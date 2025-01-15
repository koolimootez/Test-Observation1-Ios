//
//  SplashScreen.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var selectedMood: String
    @Binding var selectedMoodColor: Color

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 100) {
                Text("Comment vas-tu aujourd'hui ?")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                
                HStack(spacing: 30) {
                    moodOption(image: "face.smiling.inverse", text: "Super", color: .green)
                    moodOption(image: "face.smiling.inverse", text: "Bien", color: .green.opacity(0.7))
                    moodOption(image: "face.smiling.inverse", text: "Neutre", color: .yellow)
                    moodOption(image: "face.smiling.inverse", text: "Mauvais", color: .orange)
                    moodOption(image: "face.smiling.inverse", text: "Horrible", color: .red)
                }
            }
            .padding()
        }
    }
    
    private func moodOption(image: String, text: String, color: Color) -> some View {
        Button(action: {
            selectedMood = text
            selectedMoodColor = color
        }) {
            VStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(color)
                Text(text)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    SplashScreen(selectedMood: .constant("Super"), selectedMoodColor: .constant(.green))
}
