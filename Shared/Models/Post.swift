//
//  Post.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 05/11/2020.
//

import SwiftUI


struct Post: Codable, Hashable, Identifiable {
    
    let id: Int
    let nom: String
    let raceName: String
}
