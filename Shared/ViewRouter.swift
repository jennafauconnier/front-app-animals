//
//  ViewRouter.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 05/11/2020.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .page1
    
    @Published var animalId: Int?
    
}
