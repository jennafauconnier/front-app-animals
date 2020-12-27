//File: ListView.swift
//Project: NavigatinInSwiftUIStarter
//Created on 24.08.20
//Visit www.BLCKBIRDS.com for more tutorials.

import SwiftUI

struct ListView: View {
    
    @ObservedObject var model = ListModel()
    
    @StateObject var viewRouter: ViewRouter

    var body: some View {
            VStack(alignment: .center) {
                Text("SAVE PETS").font(.title)
                Dogs()
                NextButtonContent(viewRouter: viewRouter)
            }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewRouter: ViewRouter())
    }
}



struct NextButtonContent : View {
    
    @ObservedObject var model = ListModel()
    
    @StateObject var viewRouter: ViewRouter
    
    func fetchAnimal(animalId: Int) {
        print("fetchAnimal")
//        print(animalId)
//        model.fetchPostsAnimal(animalId: animalId)
    }

    var body: some View {
        VStack(alignment: .center) {
            List(model.posts) { post in
                Spacer()
                Button(action: {
                    print(post)
                    self.fetchAnimal(animalId: post.id)
                    viewRouter.animalId = post.id
                    viewRouter.currentPage = .page2
                }) {
                    Text(post.nom)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .padding(.leading)
                }
                Spacer()
            }
        }
    }
}

struct Dogs : View {
    var body: some View {
        Image("dogs")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 200)
            .cornerRadius(10)
            .clipped()
    }
}

