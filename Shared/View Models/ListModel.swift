//
//  ListModel.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 05/11/2020.
//

import SwiftUI
import Combine

final class ListModel: ObservableObject {
    
    init() {
        print("INIT LIST MODEL")
        fetchPosts()
    }
    
    @Published var posts = [Post]() {
        didSet {
            didChange.send(self)
        }
    }

    private func fetchPosts() {
        Webservice().getAllAnimals {
            self.posts = $0
        }
    }
    
    let didChange = PassthroughSubject<ListModel, Never>()
    let didMove = PassthroughSubject<ListModel, Never>()

}
