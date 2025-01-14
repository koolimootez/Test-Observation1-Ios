//
//  FruitDetails.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct FruitDetails: View {
    @State private var juiceIntake: Int = 0
    @State private var currentFruitIndex: Int = 0
    private let maxJuiceIntake = 1
    private let fruits = ["strawberry", "banana", "apple", "orange", "grape"]

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
                Text("Buvez de jus d'orange")
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
                Image("leaf.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .padding(.bottom, 10)
                Text("Il est recommandé de consommer 5 portions de fruits et légumes")
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text("Les fruits et légumes sont riches en vitamines, minéraux, fibres alimentaires et antioxydants, qui sont essentiels à la croissance et au développement des enfants. Ces nutriments soutiennent le fonctionnement optimal du système immunitaire, la santé des os, la vision, la peau et d'autres aspects de la santé globale.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)

                // Images horizontales
                HStack(spacing: 10) {
                    ForEach(fruits, id: \.self) { fruit in
                        Image("leaf.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(.top, 10)

                // Progression
                Text("\(currentFruitIndex + 1) / 5")
                    .font(.headline)
                    .padding(.top, 10)

                HStack(spacing: 10) {
                    ForEach(0..<5) { index in
                        Circle()
                            .fill(index <= currentFruitIndex ? Color.orange : Color.gray.opacity(0.3))
                            .frame(width: 20, height: 20)
                    }
                }
            }

            Spacer(minLength: 20)

            // Bouton Suivant
            Button(action: {
                if currentFruitIndex < fruits.count - 1 {
                    currentFruitIndex += 1
                }
            }) {
                Text("Suivant")
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
    FruitDetails()
}
