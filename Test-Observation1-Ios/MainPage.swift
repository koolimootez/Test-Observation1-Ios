//
//  MainPage.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

struct MainPage: View {
    @State private var selectedMood: String = "Super"
    @State private var selectedMoodColor: Color = .green
    @State private var navigateToMain: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top Bar
                VStack(spacing: 5) {
                    HStack {
                        Button(action: {
                            // Action pour le menu
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Text("Ma journée")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    // Date Picker Section
                    HStack {
                        Text("Juin 2024")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Days Row
                    HStack(spacing: 15) {
                        ForEach(["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"], id: \.self) { day in
                            VStack {
                                Text(day)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(day == "Mer" ? .white : .clear)
                                Text("24")
                                    .font(.caption)
                                    .fontWeight(day == "Mer" ? .bold : .regular)
                                    .foregroundColor(day == "Mer" ? .white : .white.opacity(0.7))
                            }
                        }
                    }
                }
                .padding()
                .background(Color.blue)
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Mood Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Mon humeur d'aujourd'hui")
                                .font(.headline)
                                .foregroundColor(.blue)
                            HStack {
                                Image(systemName: "face.smiling.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(selectedMoodColor)
                                Text(selectedMood)
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Spacer()
                                NavigationLink(destination: SplashScreen(selectedMood: $selectedMood, selectedMoodColor: $selectedMoodColor)) {
                                    Image(systemName: "square.and.pencil.circle.fill")
                                        .font(.title3)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .padding(.horizontal)
                        
                        // Habits Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Mes habitudes")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            ForEach(habits, id: \.self) { habit in
                                HabitRow(habit: habit)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Bottom Navigation Bar
                HStack {
                    ForEach(navItems, id: \.self) { item in
                        VStack {
                            Image(systemName: item.icon)
                                .font(.title3)
                                .foregroundColor(item.isActive ? .blue : .gray)
                            Text(item.title)
                                .font(.caption)
                                .foregroundColor(item.isActive ? .blue : .gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .background(Color.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: -2)
            }
            .ignoresSafeArea(edges: .top)
            .background(Color.gray.opacity(0.1))
            .navigationBarHidden(true)
        }
        .onAppear {
            // Auto navigate if needed (used when coming back from SplashScreen)
            if navigateToMain {
                navigateToMain = false
            }
        }
    }
}

struct HabitRow: View {
    let habit: Habit
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(habit.icon)
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5) {
                    Text(habit.title)
                        .font(.headline)
                    Text(habit.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            
            // Barre de progression sous la description
            if let progress = habit.progress, let goal = habit.goal {
                ProgressView(value: progress, total: goal)
                    .tint(.green) // Couleur verte pour la barre de progression
                    .frame(height: 10) // Taille personnalisée
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// Models
struct Habit: Hashable {
    let icon: String
    let title: String
    let description: String
    let progress: Double?
    let goal: Double?
}

struct NavItem: Hashable {
    let icon: String
    let title: String
    let isActive: Bool
}

// Sample Data
let habits: [Habit] = [
    Habit(icon: "Moon", title: "Meilleur sommeil", description: "Un bon sommeil aide l'enfant à bien se développer.", progress: nil, goal: nil),
    Habit(icon: "drop.fill", title: "Buvez suffisamment d'eau", description: "L'eau permet de maintenir le volume.", progress: 1000, goal: 1500),
    Habit(icon: "leaf.fill", title: "Consommation de fruits et légumes", description: "Les fruits et légumes sont riches en vitamines.", progress: 1, goal: 5),
    Habit(icon: "juice", title: "Boire du jus d'orange", description: "L'eau permet de maintenir le volume.", progress: 0, goal: 1),
    Habit(icon: "noscrren", title: "Pas de temps d'écran avant de dormir", description: "Éteignez tout écran au moins 2 heures avant de dormir.", progress: nil, goal: nil),
    Habit(icon: "sport", title: "Faire du sport", description: "La pratique d'une activité sportive.", progress: nil, goal: nil)
]

let navItems: [NavItem] = [
    NavItem(icon: "house.fill", title: "Accueil", isActive: true),
    NavItem(icon: "apps.ipad.landscape", title: "Applications", isActive: false),
    NavItem(icon: "doc.text", title: "Déclarations", isActive: false),
    NavItem(icon: "book.fill", title: "Formation", isActive: false),
    NavItem(icon: "lock.fill", title: "Coffre-fort", isActive: false)
]

#Preview {
    MainPage()
}
