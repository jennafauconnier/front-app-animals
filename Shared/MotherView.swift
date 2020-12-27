//
//  MotherView.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 05/11/2020.
//

import SwiftUI

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
            case .page1:
                ListView(viewRouter: viewRouter)
            case .page2:
                ItemView(viewRouter: viewRouter)
        }
    }
}


struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
