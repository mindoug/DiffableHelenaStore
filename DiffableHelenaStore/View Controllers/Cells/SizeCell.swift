//
//  SizeCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/6/22.
//

import UIKit

class SizeCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseIdentifier = String(describing: SizeCell.self)
    static let nib = UINib(nibName: String(describing: SizeCell.self), bundle: nil)
    
    func configure(with item: Item) {
        dump(item)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
