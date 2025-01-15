//
//  MeilluerSommeilDetails.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct MeilluerSommeilDetails: View {
    @State private var isChecked = false

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
                Text("Meilleur Sommeil")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "circle")
                    .foregroundColor(.clear) // Caché
            }
            .padding()
            .background(Color.blue)

            
            Spacer(minLength: 20)

            // Illustration et Description
            VStack(spacing: 10) {
                Image(systemName: "moonphase.waxing.crescent.inverse")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundColor(Color.blue)

                Text("Meilleur sommeil")
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text("Un sommeil adéquat aide également à réguler les émotions, à améliorer la concentration et à favoriser un comportement émotionnellement équilibré. En outre, il a été démontré que les enfants qui bénéficient d'un sommeil suffisant sont moins susceptibles de développer des problèmes de santé à long terme, tels que l'obésité et les troubles métaboliques.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
            }

            Spacer(minLength: 20)

            // Checkbox and Text
            HStack {
                Text("J'accepte les termes et conditions")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Spacer()

                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                        .font(.title)
                        .foregroundColor(isChecked ? .purple : .gray)
                }
            }
            .padding(.horizontal, 30)
            
            Spacer()

            // Sauvegarder Button
            Button(action: {
                // Action de sauvegarde
            }) {
                Text("Sauvegarder")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(25)
            }
            .padding(.horizontal, 30)

            Spacer()
        }
        .background(Color.gray.opacity(0.05).ignoresSafeArea())
    }
}

#Preview {
    MeilluerSommeilDetails()
}


