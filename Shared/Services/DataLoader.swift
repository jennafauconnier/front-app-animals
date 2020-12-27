//
//  DataLoader.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 24/12/2020.
//
import SwiftUI

class DataLoader: ObservableObject {

     let objectWillChange = PassthroughSubject<Data,Never>()

     var data = Data() {
        willSet {
            objectWillChange.send(newValue)
        }
    }

    private let resourseURL: URL?

    public init(resourseURL: URL?){
        self.resourseURL = resourseURL
    }

    public func loadImage() {
        guard let url = resourseURL else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }   .resume()
    }
}
