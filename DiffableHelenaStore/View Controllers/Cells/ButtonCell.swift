//
//  ButtonCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/6/22.
//

import UIKit

class ButtonCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseIdentifier = String(describing: ButtonCell.self)
    static let nib = UINib(nibName: String(describing: ButtonCell.self), bundle: nil)
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    
    func configure(with item: Item) {
        dump(item)
        amountLabel.text = item.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
