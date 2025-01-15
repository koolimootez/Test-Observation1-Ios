//
//  Declaration.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 15/01/2025.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            self.errorMessage = "URL invalide."
            return
        }

        isLoading = true
        errorMessage = nil

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false

                if let error = error {
                    self.errorMessage = "Erreur : \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self.errorMessage = "Aucune donnée reçue."
                    return
                }

                do {
                    self.posts = try JSONDecoder().decode([Post].self, from: data)
                } catch {
                    self.errorMessage = "Erreur de décodage : \(error.localizedDescription)"
                }
            }
        }

        task.resume()
    }
}

