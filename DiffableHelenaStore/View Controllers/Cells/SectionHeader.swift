//
//  SectionHeader.swift
//  DiffableHelenaStore
//
//  Created by Mindy Douglas on 1/22/23.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let kind = String(describing: SectionHeader.self)
    static let reuseIdentifier = String(describing: SectionHeader.self)
    static let nib = UINib(nibName: String(describing: SectionHeader.self), bundle: nil)
    
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
