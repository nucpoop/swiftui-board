//
//  BoardView.swift
//  swiftui-board
//
//  Created by nucpoop on 2023/04/01.
//

import SwiftUI

struct BoardListView: View{
    @StateObject private var network = RequestAPI.shared
    var body: some View{
        NavigationView{
            List{
                ForEach(network.boards, id: \.self){result in
                    BoardRow(board: result)
                }
            }.navigationTitle("게시판")
        }.onAppear{
            network.fetchData()
        }
    }
}

struct BoardListView_Previews: PreviewProvider{
    static var previews: some View{
        BoardListView()
    }
}
