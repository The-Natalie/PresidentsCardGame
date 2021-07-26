//
//  FilterViewController.swift
//  PresidentsCardGame
//
//  Created by Natalie Hall on 7/25/21.
//

import UIKit

protocol FilterViewControllerDelegate: AnyObject {
    func updateParty(isDemocrat: Bool)
}

class FilterViewController: UIViewController {

    //  MARK: - Properties
    weak var delegate: FilterViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions

    @IBAction func democratButtonTapped(_ sender: Any) {
        delegate?.updateParty(isDemocrat: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func republicanButtonTapped(_ sender: Any) {
        delegate?.updateParty(isDemocrat: false)
        dismiss(animated: true, completion: nil)
    }
    
}
