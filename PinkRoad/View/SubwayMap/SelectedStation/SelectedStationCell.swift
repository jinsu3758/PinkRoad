//
//  CollectionViewCell.swift
//  PinkRoad
//
//  Created by 박진수 on 20/06/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

class SelectedStationCell: UICollectionViewCell {
    @IBOutlet weak var numLabel: UILabel!
    
    func fill(_ num: String) {
        numLabel.text = num
        numLabel.layer.cornerRadius = 12
        numLabel.layer.masksToBounds = true
        switch num {
        case "3":
            numLabel.backgroundColor = .threeStationColor
        case "4":
            numLabel.backgroundColor = .fourStationColor
        case "6":
            numLabel.backgroundColor = .sixStationColor
        default:
            break
        }
        
    }
}
