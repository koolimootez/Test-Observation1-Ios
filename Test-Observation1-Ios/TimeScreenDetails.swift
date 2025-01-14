//
//  TimeScreenDetails.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct TimeScreenDetails: View {
    @State private var reminderTime: Date = Date() // Heure pour le rappel
        @State private var selectedDays: [Bool] = Array(repeating: false, count: 7) // Jours sélectionnés
        @State private var isReminderEnabled: Bool = false // Activer/Désactiver le rappel

        let days = ["Lun.", "Mar.", "Mer.", "Jeu.", "Ven.", "Sam.", "Dim."]

        var body: some View {
            VStack {
                // Top Bar
                HStack {
                    Button(action: {
                        // Action pour revenir en arrière
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Pas de temps d'écran avant de dormir")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "circle")
                        .foregroundColor(.clear) // Caché
                }
                .padding()
                .background(Color.blue)

           

                // Contenu principal
                VStack(spacing: 20) {
                    // Illustration
                    Image(systemName: "iphone.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(Color.red)

                    // Texte principal
                    Text("Pas de temps d'écran avant de dormir")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    // Texte secondaire
                    Text("""
    Éteignez tout écran au moins 2 heures avant le coucher. Les enfants et les adolescents sont particulièrement sensibles à la lumière des tablettes, téléphones et ordinateurs. Celle-ci retarde l'endormissement.
    """)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)

                    // Rappel
                    HStack {
                        Text("M'envoyer un rappel")
                            .font(.body)
                        Spacer()
                        DatePicker("", selection: $reminderTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    .padding(.horizontal, 20)

                    // Activer/Désactiver rappel
                    HStack {
                        Text("Répéter le")
                            .font(.body)
                        Spacer()
                        Toggle("", isOn: $isReminderEnabled)
                            .labelsHidden()
                    }
                    .padding(.horizontal, 20)

                    // Sélection des jours
                    HStack(spacing: 10) {
                        ForEach(0..<days.count, id: \.self) { index in
                            Text(days[index])
                                .font(.body)
                                .padding()
                                .frame(width: 45, height: 60)
                                .background(
                                    Circle()
                                        .fill(selectedDays[index] ? Color.green : Color.green)
                                )
                                .foregroundColor(.white)
                                .onTapGesture {
                                    selectedDays[index].toggle()
                                }
                        }
                    }
                                    
                    // Bouton Sauvegarder
                    Button(action: {
                        // Action de sauvegarde
                    }) {
                        Text("Sauvegarder")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(25)
                    }
                    .padding(.horizontal, 20)
                }
                .padding()
                
                .cornerRadius(20)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)

                Spacer()
            }
            .background(Color.gray.opacity(0.1).ignoresSafeArea())
        }
    }

#Preview {
    TimeScreenDetails()
}

