//
//  MenuCell.swift
//  UIDesign
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

class MenuCell: UITableViewCell {
    
    private var selectedMenuInt = 0
    @IBOutlet weak var byRatesView: MenuItem!
    @IBOutlet weak var byRatesLabel: UILabel!
    
    
    @IBOutlet weak var byRoomView: MenuItem!
    @IBOutlet weak var byRoomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [byRatesLabel, byRoomLabel].forEach {
            $0?.isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(target: self, action: #selector(selectMenu(_:)))
            $0?.addGestureRecognizer(gesture)
        }
    }

    @objc private func selectMenu(_ gesture: UITapGestureRecognizer) {
        let tag = (gesture.view as? UILabel)?.tag ?? 0
        
        let selectedColor = UIColor(displayP3Red: 151/255, green: 192/255, blue: 212/255, alpha: 1.0)
        let unselectedColor = UIColor.white
        byRoomView.backgroundColor = tag == 0 ? selectedColor: unselectedColor
        byRatesView.backgroundColor = tag == 1 ? selectedColor: unselectedColor
    }
    
}
