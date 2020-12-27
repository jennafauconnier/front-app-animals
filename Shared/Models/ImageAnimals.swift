//
//  ImageAnimals.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 24/12/2020.
//

import SwiftUI

struct WebImage: View {

    @ObservedObject private var imageLoader: DataLoader

    public init(imageURL: URL?) {
        imageLoader = DataLoader(resourseURL: imageURL)
    }

    public var body: some View {
        if let uiImage = UIImage(data: self.imageLoader.data) {
            return AnyView(Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: ContentMode.fit))
        } else {
            return AnyView(Image(systemName: "ellipsis")
                            .onAppear(perform: { self.imageLoader.loadImage() }))
        }
    }
}
