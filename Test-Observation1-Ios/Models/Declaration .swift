//
//  Declaration .swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 15/01/2025.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
