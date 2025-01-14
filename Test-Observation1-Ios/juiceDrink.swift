//
//  juiceDrink.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct juiceDrink: View {
    @State private var juiceIntake: Int = 0
      private let maxJuiceIntake = 1

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
                  Image(systemName: "cup.and.saucer.fill") // Remplacez par une image de verre si nécessaire
                      .resizable()
                      .scaledToFit()
                      .frame(height: 120)
                      .foregroundColor(Color.orange)

                  Text("Un verre de jus d'orange chaque matin")
                      .font(.headline)
                      .multilineTextAlignment(.center)

                  Text("Les enfants sont particulièrement sensibles à la déshydratation. En règle générale, on leur conseille de boire en moyenne entre 6 et 8 verres d'eau par jour.")
                      .font(.subheadline)
                      .foregroundColor(.gray)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal, 30)
              }

              Spacer(minLength: 20)

              // Cercle d'affichage
              ZStack {
                
                  Circle()
                      .fill(Color.gray.opacity(0.1))
                      .frame(width: 300, height: 300)
                  
                  Circle()
                      .stroke(Color.gray.opacity(0.2), lineWidth: 15)
                      .frame(width: 150, height: 150)

                  if juiceIntake > 0 {
                      Circle()
                          .trim(from: 0, to: CGFloat(juiceIntake) / CGFloat(maxJuiceIntake))
                          .stroke(Color.orange, lineWidth: 15)
                          .rotationEffect(.degrees(-90))
                          .frame(width: 150, height: 150)
                          .animation(.easeInOut, value: juiceIntake)
                  }

                  Image(systemName: "cup.and.saucer") // Ombre grisée
                      .resizable()
                      .scaledToFit()
                      .frame(height: 80)
                      .foregroundColor(juiceIntake > 0 ? Color.orange : Color.gray.opacity(0.4))
                      .animation(.easeInOut, value: juiceIntake)
                  
                  Text("\(juiceIntake) / \(maxJuiceIntake)")
                      .font(.headline)
                      .foregroundColor(.black)
              }

              Spacer()

              // Bouton Sauvegarder
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
    juiceDrink()
}
