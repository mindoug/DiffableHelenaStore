//
//  CategoryCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/1/22.
//

import UIKit

class CategoryCell: UICollectionViewCell, SelfConfiguringCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dotLabel: UILabel!
    
    static let reuseIdentifier = String(describing: CategoryCell.self)
    static let nib = UINib(nibName: String(describing: CategoryCell.self), bundle: nil)
    
    func configure(with item: Item) {
        dump(item)
        categoryLabel.text = item.title
        dotLabel.text = item.subtitle
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
