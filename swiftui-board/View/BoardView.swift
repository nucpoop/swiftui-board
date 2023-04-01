//
//  BoardView.swift
//  swiftui-board
//
//  Created by nucpoop on 2023/04/01.
//

import SwiftUI

struct BoardView: View{
    @StateObject private var network = RequestAPI.shared
    var body: some View{
        NavigationView{
            List{
                ForEach(network.boards, id: \.self){result in
                    Text(result.title)
                }
            }.navigationTitle("게시판")
        }.onAppear{
            network.fetchData()
        }
    }
}

struct BoardView_Previews: PreviewProvider{
    static var previews: some View{
        BoardView()
    }
}
