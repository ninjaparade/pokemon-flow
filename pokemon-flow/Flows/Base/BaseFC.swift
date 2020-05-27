//
//  BaseFC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-27.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

// MARK: - FlowCoordinator

protocol FlowCoordinator: class {
    var context: AppContext { get set }
    
    var rootViewController: UIViewController { get }
    
    var childFCs: [FlowCoordinator] { get set }

    func start()
}


// MARK: - FlowCoordinator (Helpers)

extension FlowCoordinator {
    func addChildFC(_ childFC: FlowCoordinator) {
        childFCs.append(childFC)
    }

    func removeChildFC(_ childFC: FlowCoordinator) {
        childFCs = childFCs.filter { $0 !== childFC }
    }
}

// MARK: - BaseFC

typealias BaseFC = BaseFCImplementation & FlowCoordinator


// MARK: - BaseFCImplementation: NSObject

class BaseFCImplementation: NSObject {

    // MARK: Properties

    var context: AppContext
    var childFCs: [FlowCoordinator] = []
    var rootViewController: UIViewController { return UINavigationController() }
    var lastModalPresentedByViewController: UIViewController?

    // MARK: Initializer

    init(context: AppContext) {
        self.context = context
    }

    // MARK: FlowCoordinator

    func start() {}
}


