//
//  UIViewController+ModalTransitioning.swift
//  Bedrock
//
//  Created by Matthew Quiros on 11/09/2019.
//  Copyright © 2019 Matt Quiros. All rights reserved.
//

import UIKit

extension UIViewController {
	
	func setCustomTransitioningDelegate(_ transitioningDelegate: UIViewControllerTransitioningDelegate) {
		self.transitioningDelegate = transitioningDelegate
		self.modalPresentationStyle = .custom
	}
	
}