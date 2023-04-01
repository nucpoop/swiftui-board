//
//  Board.swift
//  swiftui-board
//
//  Created by nucpoop on 2023/04/01.
//

import Foundation

struct Results: Decodable{
    let boards: [Board]
}

struct Board: Decodable, Hashable{
    let title: String
    let content: String
}
