//
//  BaseNavigationController.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    // MARK: Properties

    let context: AppContext
    
    init(context: AppContext) {
        self.context = context
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
