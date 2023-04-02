//
//  BoardRow.swift
//  swiftui-board
//
//  Created by nucpoop on 2023/04/02.
//

import SwiftUI

struct BoardRow: View {
    var board: Board
    var body: some View{
        Text(board.title)
    }
}

struct BoardRow_Previews: PreviewProvider{
    static var previews: some View{
        BoardRow(board: Board(title: "test", content: "test"))
    }
}
