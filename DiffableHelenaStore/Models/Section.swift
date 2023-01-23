//
//  Section.swift
//  DiffableHelenaStore
//
//  Created by Mindy Douglas on 1/21/23.
//

import Foundation

struct Section: Hashable, Decodable {
    
    let id: Int
    let type: String
    let title: String
    let items: [Item]
}
