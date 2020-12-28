//File: ItemView.swift
//Project: NavigatinInSwiftUIStarter
//Created on 24.08.20
//Visit www.BLCKBIRDS.com for more tutorials.

import SwiftUI
import Combine
import SDWebImageSwiftUI



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
                        
            HStack {
                Text("Salut je suis")
                Text(model.animal.first?.nom ?? "")
            }
            
            HStack {
                WebImage(url: URL(string: model.animal.first?.image_url ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .padding()

            }

            HStack  {
                Text("Je suis un")
                Text(model.animal.first?.name ?? "")
            }
            
            HStack{
                Text("Naissance :")
                Text(self.stringToDate(ISOdate: model.animal.first?.date_naissance ?? ""))
            }
            
            HStack {
                Text("Sexe :")
                Text(model.animal.first?.sexe ?? "").font(.system(size: 20))
            }
            
            Button(action: {
                guard let number = URL(string: "tel://" + "4151231234") else { return }
                UIApplication.shared.open(number)
                
            }) {
                CallButtonContent()
            }
            
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

struct CallButtonContent : View {
    var body: some View {
        return Text("Appeler")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.green)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}
    

