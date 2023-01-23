//
//  HeaderImageCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/8/22.
//

import UIKit

class HeaderImageCell: UICollectionViewCell, SelfConfiguringCell {

    static let reuseIdentifier = String(describing: HeaderImageCell.self)
    static let nib = UINib(nibName: String(describing: HeaderImageCell.self), bundle: nil)
    
    @IBOutlet weak var image: UIImageView!
    
    
    func configure(with item: Item) {
        dump(item)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
