//
//  UIViewController+Ext.swift
//  Veryable-iOS-Challenge-NBirch
//
//  Created by Birch, Nathan J on 7/9/21.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    func showLoadingView() {
        // make container view with a set bounds
        containerView = UIView(frame: view.bounds)
        // add to view
        view.addSubview(containerView)
        
        // initial style settup
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        // create animation
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        // making loading spinner thing
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        // add to containerView
        containerView.addSubview(activityIndicator)
        
        // allow autolayout
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        // customize autolayout
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // makes sure that animation starts right when the view loads
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
}

