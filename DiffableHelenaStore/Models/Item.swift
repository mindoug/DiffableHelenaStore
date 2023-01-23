//
//  Item.swift
//  DiffableHelenaStore
//
//  Created by Mindy Douglas on 1/21/23.
//

import Foundation

struct Item: Hashable, Decodable {
    
    let id: Int
    let title: String
    let subtitle: String
    let image: String
}
