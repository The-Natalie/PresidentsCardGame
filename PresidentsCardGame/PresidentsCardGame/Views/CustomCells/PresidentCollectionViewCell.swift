//
//  PresidentCollectionViewCell.swift
//  PresidentsCardGame
//
//  Created by Natalie Hall on 7/25/21.
//

import UIKit

class PresidentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var presidentImageView: UIImageView!
    
    func displayImageFor(president: President) {
        presidentImageView.image = president.photo
        presidentImageView.contentMode = .scaleAspectFill
    }
}
