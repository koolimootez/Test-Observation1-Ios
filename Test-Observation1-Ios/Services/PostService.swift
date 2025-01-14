//
//  PostService.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//


import Foundation
/*
class APIService: ObservableObject {
    @Published var posts: [Post] = []
    
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        self.posts = decodedPosts
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}
*/
