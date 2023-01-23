//
//  SelfConfiguringCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 1/16/23.
//

import Foundation

protocol SelfConfiguringCell {
  static var reuseIdentifier: String { get }
  func configure(with item: Item)
}
