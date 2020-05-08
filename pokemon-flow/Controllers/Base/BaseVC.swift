//
//  BaseVC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    let context: AppContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(context: AppContext) {
        self.context = context
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
