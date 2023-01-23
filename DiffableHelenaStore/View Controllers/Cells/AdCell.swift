//
//  HeaderCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/1/22.
//

import UIKit

class AdCell: UICollectionViewCell, SelfConfiguringCell {

    static let reuseIdentifier = String(describing: AdCell.self)
    static let nib = UINib(nibName: String(describing: AdCell.self), bundle: nil)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var adImage: UIImageView!
    
    
    func configure(with item: Item) {
        dump(item)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        adImage.image = UIImage(named: item.image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
