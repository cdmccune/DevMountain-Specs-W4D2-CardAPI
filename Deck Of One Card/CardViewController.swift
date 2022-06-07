//
//  CardViewController.swift
//  Deck Of One Card
//
//  Created by Curt McCune on 6/7/22.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchImageAndUpdateView(for card: Card) {
        CardController.fetchImage(for: card) { result in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.presentAlert(localizedError: error)
                case .success(let image):
                    self.cardImageView.image = image
                    self.cardLabel.text = "\(card.value) of \(card.suit)"
                }
            }
        }
    }
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        
        CardController.fetchCard { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateView(for: card)
                case .failure(let error):
                    self?.presentAlert(localizedError: error)
                }
            }
        }
        
    }
    
    
}
