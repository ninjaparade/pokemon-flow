//
//  BaseDS.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-26.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

enum BaseDSState {
    case ready, empty, normal, loading, error
}


// MARK: - BaseTableDS: NSObject, UITableViewDataSource

class BaseTableDS: NSObject, UITableViewDataSource {
    
    
    
    // MARK: Properties

    let context: AppContext
    var sectionStates: [BaseDSState] = [.normal]

    // MARK: Initializer

    init(context: AppContext) {
        self.context = context
    }

    // MARK: UITableViewDataSource

    final func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceNumberOfSections(in: tableView)
    }

    final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sectionStates[section] {
        case .error, .empty:
            return 1
        default:
            return dataSourceTableView(tableView, numberOfRowsInSection: section)
        }
    }
    
    final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // unused
        UITableViewCell()
    }
            
    // MARK: Reload Data

    func reload(completion: @escaping (Bool) -> Void, error: @escaping (String) -> Void) {
        completion(true)
    }

    // MARK: Default Behaviors

    func dataSourceNumberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func dataSourceTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
