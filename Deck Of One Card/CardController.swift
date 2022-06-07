//
//  CardController.swift
//  Deck Of One Card
//
//  Created by Curt McCune on 6/7/22.
//

import Foundation
import UIKit
class CardController {
    
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        //URL
        
        guard let url = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {
            return completion(.failure(.invalidURL))
        }
        
        //Contact Servers
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            //Handle errors
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            
            //Check for data
            guard let data = data else {
                return completion(.failure(.noData))
            }

            
            //Decode Data
        
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let card = topLevelObject.cards[0]
                return completion(.success(card))
            } catch {
                return completion(.failure(.unableToDecode))
            }
            
            
        }.resume()
        
    }
    
    static func fetchImage (for card: Card, completion: @escaping (Result<UIImage, CardError>) -> Void) {
        //URL
        
        let url = card.image
        
        //Contact Server
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            //Error
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            //Data
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            //Decode
            guard let image = UIImage(data: data) else {
                return completion(.failure(.unableToDecode))
            }
            
            return completion(.success(image))

        }.resume()
    }
    
}
