//
//  BaseTabVC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-27.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class BaseTabVC: UITabBarController {
    
    let context: AppContext
    var dataSource: BaseTableDS
    
    init(context: AppContext) {
        self.context = context
        self.dataSource = BaseTableDS(context: context)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaults()
    }
    
    
    func setDefaults() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChildVC(children: [UIViewController], animated: Bool = true){
        setViewControllers(children, animated: animated)
    }
}
