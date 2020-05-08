//
//  LandingFC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class LandingFC: BaseFC {
    
    override var rootViewController: UIViewController { return navigationController }

    lazy var navigationController: BaseNavigationController = {
        let navigationController = BaseNavigationController(context: context)
        navigationController.isNavigationBarHidden = true
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    override func start() {
        print("Landing FC Started")
    }
}
