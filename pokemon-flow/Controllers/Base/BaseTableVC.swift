//
//  BaseTableVC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-26.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class BaseTableVC: UITableViewController {
    
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UITableViewDataSource

    override final func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections(in: tableView)
    }

    override final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.tableView(tableView, numberOfRowsInSection: section)
    }
    
}
