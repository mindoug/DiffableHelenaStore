//
//  DescriptionCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/6/22.
//

import UIKit

class DescriptionCell: UICollectionViewCell, SelfConfiguringCell {

    static let reuseIdentifier = String(describing: DescriptionCell.self)
    static let nib = UINib(nibName: String(describing: DescriptionCell.self), bundle: nil)
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(with item: Item) {
        dump(item)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
