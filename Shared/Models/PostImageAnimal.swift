//
//  PostImageAnimal.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 17/11/2020.
//


import SwiftUI


struct PostImageAnimal: Codable, Hashable, Identifiable {
    
    let id = UUID()
    let image_url : String
}
