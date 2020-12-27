//File: NavigatinInSwiftUIStarterApp.swift
//Project: NavigatinInSwiftUIStarter
//Created on 24.08.20
//Visit www.BLCKBIRDS.com for more tutorials.

import SwiftUI

@main
struct NavigatinInSwiftUIStarterApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: ViewRouter())
        }
    }
}
