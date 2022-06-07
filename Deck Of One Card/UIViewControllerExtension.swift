//
//  UIViewControllerExtension.swift
//  Deck Of One Card
//
//  Created by Curt McCune on 6/7/22.
//

import UIKit


extension UIViewController {
    
    func presentAlert(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.localizedDescription, preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
