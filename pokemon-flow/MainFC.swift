//
//  MainFC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class MainFC: BaseFC {
        
    
    override var rootViewController: UIViewController { return navigationController }
    
    lazy var navigationController: BaseNavigationController = {
        let navigationController = BaseNavigationController(context: context)
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.backgroundColor = .white
        navigationController.isNavigationBarHidden = true
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    weak var window: UIWindow?
    
    init(window: UIWindow, context: AppContext) {
        super.init(context: context)
        self.window = window
        window.backgroundColor = .white
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let pokemonFC = PokemonTypeFC(context: self.context)
        
        startWithDelay(coordinator: pokemonFC)
    }
    
    
    private func startWithDelay(coordinator: FlowCoordinator) {
           // NOTE: use a delay of 0.0 so that the presentation happens "after the app has initialized"
           DispatchQueue.main.asyncAfter(deadline: .now()) {
               coordinator.start()
               self.addChildFC(coordinator)
               self.rootViewController.present(coordinator.rootViewController, animated: true)
           }
       }

}

