//
//  DetailHeaderCell.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 12/7/22.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: HeaderCell.self)
    static let nib = UINib(nibName: String(describing: HeaderCell.self), bundle: nil)
    
    @IBOutlet weak var headerLabel: UILabel!
    
    func configure(with item: Item) {
        dump(item)
        headerLabel.text = item.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
