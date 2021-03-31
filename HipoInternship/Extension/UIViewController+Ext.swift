//
//  UIViewController+Ext.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 31.03.2021.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
        
        alertController.addAction(okeyAction)
        present(alertController, animated: true, completion: nil)
    }
}
