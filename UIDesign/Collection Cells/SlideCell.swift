//
//  SlideCell.swift
//  UIDesign
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

class SlideCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(imageName: String) {
        slideImageView.image = UIImage(named: imageName)
        
    }

}
