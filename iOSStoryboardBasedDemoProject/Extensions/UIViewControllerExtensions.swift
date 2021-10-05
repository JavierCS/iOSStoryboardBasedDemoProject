//
//  UIViewControllerExtensions.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 29/09/21.
//

import UIKit

extension UIViewController {
    func showLoader(completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "", message: "Por favor espere...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        alert.modalPresentationStyle = .overCurrentContext
        present(alert, animated: true, completion: completion)
    }
    
    func hideLoader(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
}
