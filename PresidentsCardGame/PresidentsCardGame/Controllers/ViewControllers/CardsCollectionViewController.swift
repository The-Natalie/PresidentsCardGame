//
//  CardsCollectionViewController.swift
//  PresidentsCardGame
//
//  Created by Natalie Hall on 7/25/21.
//

import UIKit

class CardsCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    var presidentCards: [President] = []
    var partyIsDemocrat: Bool = true
    var targetPresident: President?

    //  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCards()
        updateView()
    }
    
    //  MARK: - Methods
    func shuffleCards() {
        presidentCards = []
        
        var targetParty: [President] = []
        var offTargetPresident: President?
        
        if partyIsDemocrat {
            targetParty = Array(PresidentController.democrat.shuffled().prefix(3))
            offTargetPresident = PresidentController.republican.randomElement()
        } else {
            targetParty = Array(PresidentController.republican.shuffled().prefix(3))
            offTargetPresident = PresidentController.democrat.randomElement()
        }
        
        presidentCards.append(contentsOf: targetParty)
        
        targetPresident = presidentCards.randomElement()
        
        if let offTargetPresident = offTargetPresident {
            presidentCards.append(offTargetPresident)
        }
        
        presidentCards.shuffle()
    }
    
    func updateView() {
        title = "Find \(targetPresident?.name ?? "unknown")"
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "presidentCell", for: indexPath) as? PresidentCollectionViewCell else { return UICollectionViewCell() }
        
        let president = presidentCards[indexPath.row]
        
        cell.displayImageFor(president: president)
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPresident = presidentCards[indexPath.row]
        
        let isCorrect = selectedPresident == targetPresident
        
        presentResultAlert(isCorrect: isCorrect)
    }
}   //  End of Class



//  MARK: - COLLECTION VIEW FLOW LAYOUT DELEGATE METHODS
extension CardsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width * 0.45
        
        return CGSize(width: width, height: width * 4 / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let oneCellWidth = view.frame.width * 0.45
        
        let cellsTotalWidth = oneCellWidth * 2
        
        let leftoverWidth = view.frame.width - cellsTotalWidth
                
        let inset = leftoverWidth / 3
        
        return UIEdgeInsets(top: inset, left: inset, bottom: 0, right: inset)
    }
}

//  MARK: - ALERTS
extension CardsCollectionViewController {
    func presentResultAlert(isCorrect: Bool) {
        var title: String = ""
        
        if isCorrect {
            title = "You chose wisely!"
        } else {
            title = "You chose poorly. Try again."
        }
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .default)
        
        let shuffeAction = UIAlertAction(title: "Shuffle!", style: .default) { _ in
            self.shuffleCards()
            self.updateView()
        }
        
        if isCorrect {
            alert.addAction(shuffeAction)
        } else {
            alert.addAction(doneAction)
        }
        
        present(alert, animated: true)
    }
}

//  MARK: - filter view controller delegate methods
extension CardsCollectionViewController: FilterViewControllerDelegate {
    func updateParty(isDemocrat: Bool) {
        partyIsDemocrat = isDemocrat
        shuffleCards()
        updateView()
    }
}

//  MARK: - NAVIGATION
extension CardsCollectionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterVC" {
            let destination = segue.destination as? FilterViewController
            destination?.delegate = self
        }
    }
}
