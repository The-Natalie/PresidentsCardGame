//
//  PresidentController.swift
//  PresidentsCardGame
//
//  Created by Natalie Hall on 7/25/21.
//

import Foundation
import UIKit

class PresidentController {
    static let democrat = [
        President(name: "Joe Biden", party: "Democrat", photo: #imageLiteral(resourceName: "biden")),
        President(name: "Barack Obama", party: "Democrat", photo: #imageLiteral(resourceName: "obama")),
        President(name: "Bill Clinton", party: "Democrat", photo: #imageLiteral(resourceName: "clinton")),
        President(name: "Jimmy Carter", party: "Democrat", photo: #imageLiteral(resourceName: "carter")),
        President(name: "Lyndon B. Johnson", party: "Democrat", photo: #imageLiteral(resourceName: "johnson")),
        President(name: "John F. Kennedy", party: "Democrat", photo: #imageLiteral(resourceName: "kennedy")),
        President(name: "Harry S. Truman", party: "Democrat", photo: #imageLiteral(resourceName: "truman"))
    ]
    
    static let republican = [
        President(name: "Donald Trump", party: "Republican", photo: #imageLiteral(resourceName: "trump")),
        President(name: "George Bush Jr.", party: "Republican", photo: #imageLiteral(resourceName: "bush-jr")),
        President(name: "George Bush Sr.", party: "Republican", photo: #imageLiteral(resourceName: "bush-sr")),
        President(name: "Ronald Reagan", party: "Republican", photo: #imageLiteral(resourceName: "reagan")),
        President(name: "Gerald Ford", party: "Republican", photo: #imageLiteral(resourceName: "ford")),
        President(name: "Richard Nixon", party: "Republican", photo: #imageLiteral(resourceName: "nixon")),
        President(name: "Dwight D. Eisenhower", party: "Republican", photo: #imageLiteral(resourceName: "eisenhower"))
    ]
}
