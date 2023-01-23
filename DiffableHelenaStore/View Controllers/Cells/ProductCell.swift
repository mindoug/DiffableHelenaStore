//
//  SelectionCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/1/22.
//

import UIKit

class ProductCell: UICollectionViewCell, SelfConfiguringCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let reuseIdentifier = String(describing: ProductCell.self)
    static let nib = UINib(nibName: String(describing: ProductCell.self), bundle: nil)
    
    func configure(with item: Item) {
        dump(item)
        image.image = UIImage(named: item.image)
        subtitleLabel.text = item.subtitle
        titleLabel.text = item.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
