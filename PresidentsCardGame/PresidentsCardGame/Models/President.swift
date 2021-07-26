//
//  Presidents.swift
//  PresidentsCardGame
//
//  Created by Natalie Hall on 7/25/21.
//

import Foundation
import UIKit

class President {
    let name: String
    let party: String
    let photo: UIImage
    
    init(name: String, party: String, photo: UIImage) {
        self.name = name
        self.party = party
        self.photo = photo
    }
}

extension President: Equatable {
    static func == (lhs: President, rhs: President) -> Bool {
        return lhs.name == rhs.name && lhs.party == rhs.party
    }
}
