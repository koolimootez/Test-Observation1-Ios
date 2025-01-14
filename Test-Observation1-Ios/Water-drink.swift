//
//  Water-drink.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct Water_drink: View {
    @State private var waterIntake: Int = 0
       private let maxWaterIntake = 10

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
                   Text("Buvez suffisamment d'eau")
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
                   Image(systemName: "drop.fill") // Remplacez par une illustration personnalisée si besoin
                       .resizable()
                       .scaledToFit()
                       .frame(height: 120)
                       .foregroundColor(Color.blue)

                   Text("Combien de verres d'eau avez-vous bu aujourd'hui ?")
                       .font(.body)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 30)

                   Text("Les enfants sont particulièrement sensibles à la déshydratation. En règle générale, on leur conseille de boire en moyenne entre 6 et 8 verres d'eau par jour.")
                       .font(.subheadline)
                       .foregroundColor(.gray)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 30)
               }

               Spacer(minLength: 20)

               // Cercle d'affichage avec l'effet de vague
               ZStack {
                   // Cercle de fond
                   Circle()
                       .stroke(Color.gray.opacity(0.2), lineWidth: 15)
                       .frame(width: 200, height: 200)

                   // Niveau d'eau dynamique avec effet de vague
                   Circle()
                       .fill(Color.blue)
                       .frame(width: 200, height: 200)
                       .mask(
                           GeometryReader { geometry in
                               VStack {
                                   Spacer()
                                   WaveView(progress: CGFloat(waterIntake) / CGFloat(maxWaterIntake))
                                       .frame(height: geometry.size.height * CGFloat(waterIntake) / CGFloat(maxWaterIntake))
                               }
                           }
                       )
                       .animation(.easeInOut, value: waterIntake)
                   Circle()
                       .fill(Color.gray.opacity(0.1))
                       .frame(width: 300, height: 300)

                   // Texte au centre
                   Text("\(waterIntake) L")
                       .font(.largeTitle)
                       .fontWeight(.bold)
                       .foregroundColor(.black)
               }
               .padding(.bottom, 20)

               // Boutons d'ajustement
               HStack(spacing: 30) {
                   Button(action: {
                       if waterIntake > 0 {
                           waterIntake -= 1
                       }
                   }) {
                       Image(systemName: "minus")
                           .font(.title2)
                           .frame(width: 50, height: 50)
                           .foregroundColor(.blue)
                           .background(Color.white)
                           .clipShape(Circle())
                           .shadow(radius: 2)
                   }

                   Button(action: {
                       if waterIntake < maxWaterIntake {
                           waterIntake += 1
                       }
                   }) {
                       Image(systemName: "plus")
                           .font(.title2)
                           .frame(width: 50, height: 50)
                           .foregroundColor(.blue)
                           .background(Color.white)
                           .clipShape(Circle())
                           .shadow(radius: 2)
                   }
               }

               Spacer(minLength: 20)

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

   // Vue personnalisée pour simuler une vague
   struct WaveView: View {
       var progress: CGFloat // Le niveau d'eau entre 0 et 1

       var body: some View {
           ZStack {
               Path { path in
                   let width: CGFloat = 200
                   let height: CGFloat = 100 // Hauteur de l'animation

                   path.move(to: CGPoint(x: 0, y: height / 2))
                   for x in stride(from: 0, through: width, by: 1) {
                       let relativeX = x / width
                       let sine = sin(relativeX * .pi * 2)
                       let y = height / 2 + sine * 10 // Amplitude de la vague
                       path.addLine(to: CGPoint(x: x, y: y))
                   }
                   path.addLine(to: CGPoint(x: width, y: height))
                   path.addLine(to: CGPoint(x: 0, y: height))
                   path.closeSubpath()
               }
               .fill(Color.blue)
           }
           .scaleEffect(y: progress, anchor: .bottom)
       }
   }
#Preview {
    Water_drink()
}
