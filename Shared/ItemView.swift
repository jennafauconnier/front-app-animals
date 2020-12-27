//File: ItemView.swift
//Project: NavigatinInSwiftUIStarter
//Created on 24.08.20
//Visit www.BLCKBIRDS.com for more tutorials.

import SwiftUI

import Combine

struct ItemView: View {
    @ObservedObject var model = ItemModel()
    
    @StateObject var viewRouter: ViewRouter
    
    init(viewRouter: ViewRouter) {
        _viewRouter = StateObject(wrappedValue: viewRouter)
        
        if (viewRouter.animalId != nil) {
            model.fetchPostsAnimal(animalId: viewRouter.animalId!)
            print(model.animal.first?.image_url)
        }
    }
    
    
    
    private func stringToDate (ISOdate: String) -> String {
        
        var date:Date = Date()

        let formatter = ISO8601DateFormatter()

        date = formatter.date(from: ISOdate) ?? Date()
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "MM-dd-yyyy HH:mm"
        
        return formatter2.string(from: date)

    }
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Bonjour je suis ")
            Text(model.animal.first?.image_url ?? "")
            Text(model.animal.first?.nom ?? "")
            Text(model.animal.first?.name ?? "")
            Text(model.animal.first?.sexe ?? "").font(.system(size: 90))
            Text(self.stringToDate(ISOdate: model.animal.first?.date_naissance ?? ""))

            Button(action: {
                viewRouter.currentPage = .page1
            }) {
                BackButtonContent()
            }
        }
    }
}


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(viewRouter: ViewRouter())
    }
}

struct BackButtonContent : View {
    var body: some View {
        return Text("Retour")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}


struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
var body: some View {
    VStack {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
    }.onReceive(imageLoader.dataPublisher) { data in
        self.image = UIImage(data: data) ?? UIImage()
    }
  }
}
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
