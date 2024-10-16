//
//  Helper.swift
//  WhatAnApp
//
//  Created by Cassie on 2024/10/16.
//

import UIKit
import Foundation

typealias VoidClosure = () -> Void

let BigHelper = Helper.shared

final class Helper: NSObject {
    
    static let shared = Helper()
    
}


//UI Helper
extension Helper {
    
    func getCurrentTopVC() -> UIViewController? {
        if let window = UIApplication.shared.windows.first, var vc = window.rootViewController {
            while let presentedViewController = vc.presentedViewController {
               vc = presentedViewController
            }
            return vc
        }
        return nil
    }
    
}


extension NSObject {
    
    func showAlert(okAction: VoidClosure? = nil) {
        let localizedMsg = "Error, please try again later".localized
        let alert = UIAlertController(title: "", message: localizedMsg, preferredStyle: .alert)
        
        if let okClosure = okAction {
            let alertCancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
            let alertOkAction = UIAlertAction(title: "Ok".localized, style: .default) {
                action in
                okClosure()
            }
            alert.addAction(alertCancelAction)
            alert.addAction(alertOkAction)
        }
        else {
           let alertAction = UIAlertAction(title: "Ok".localized, style: .default, handler: nil)
           alert.addAction(alertAction)
        }
        
        if let vc = BigHelper.getCurrentTopVC() {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
}


extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
