//
//  ItemModel.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 05/11/2020.
//

import SwiftUI
import Combine

final class ItemModel: ObservableObject {
    
    init() {
        print("init ItemModel")
    }

    @Published var animal = [PostAnimal]() {
        didSet {
            didMove.send(self)
        }
    }
    
    func fetchPostsAnimal(animalId: Int) {
        Webservice().getOneAnimal(animalId: animalId) {
            self.animal = $0
        }
    }
    
    let didChange = PassthroughSubject<ItemModel, Never>()
    let didMove = PassthroughSubject<ItemModel, Never>()

}
