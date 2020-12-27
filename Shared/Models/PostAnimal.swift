//
//  PostAnimal.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 09/11/2020.
//

import SwiftUI


struct PostAnimal: Codable, Hashable, Identifiable {
    
    let id: Int
    let nom: String
    let name: String
    let date_naissance: String
    let sexe: String
    let image_url : String
}

