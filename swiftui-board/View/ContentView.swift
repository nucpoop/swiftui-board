//
//  ContentView.swift
//  swiftui-board
//
//  Created by nucpoop on 2023/04/01.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var network = RequestAPI.shared
    var body: some View {
        TabView{
            BoardListView().tabItem{
                Image(systemName: "list.bullet")
                Text("게시판")
            }.badge(network.boards.count)
            
            LoginView().tabItem{
                Image(systemName: "person")
                Text("로그인")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
