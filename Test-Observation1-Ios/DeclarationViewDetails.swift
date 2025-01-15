//
//  DeclarationViewDetails.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 15/01/2025.
//

import SwiftUI

struct DeclarationViewDetails: View {
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        VStack(spacing: 0) {
            // En-tête avec le titre et le calendrier
            HeaderView()

            // Liste des déclarations
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Mes déclarations")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    ForEach(viewModel.posts) { post in
                        DeclarationCard(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .background(Color(.systemGray6))
        }
        .onAppear {
            viewModel.fetchPosts()
        }
        .edgesIgnoringSafeArea(.top) // Permet d'étendre l'en-tête sur toute la zone supérieure
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 8) {
            // Titre
            HStack {
                Text("Déclarations")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
            }
            .padding()

            // Sélecteur de mois
            HStack {
                Spacer()
                Text("Juin 2024")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.bottom, 8)

            // Jours de la semaine
            HStack(spacing: 8) {
                ForEach(["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"], id: \.self) { day in
                    Text(day)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.8))
                        .frame(maxWidth: .infinity)
                }
            }

            // Nombres des jours
            HStack(spacing: 8) {
                ForEach(22...28, id: \.self) { date in
                    Text("\(date)")
                        .font(.headline)
                        .foregroundColor(date == 24 ? .blue : .white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .background(date == 24 ? Color.white : Color.clear)
                        .cornerRadius(16)
                }
            }
        }
        .background(Color.blue)
        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
}

struct DeclarationCard: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // En-tête avec l'avatar et le nom
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)

                Text("Leanne Graham")
                    .font(.headline)
            }

            // Titre de la déclaration
            Text(post.title)
                .font(.subheadline)
                .fontWeight(.bold)

            // Corps de la déclaration
            Text(post.body)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)

            // Pied avec ID et bouton
            HStack {
                Text("POST ID : \(post.id)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Button(action: {
                    print("Detail tapped for post \(post.id)")
                }) {
                    Text("Detail")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// Extension pour gérer les coins arrondis spécifiques
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    DeclarationViewDetails()
}



 
