//
//  PokemonSpeciesVC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-06-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonSpeciesVC: BaseTableVC {
    
    init(context: AppContext, dataSource: PokemonSpeciesDS) {
        super.init(context: context, dataSource: dataSource)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        super.viewDidLoad()
    }
    
   override func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//       guard let typesDS = dataSource as? TypesDS else { return cell }
//       let name: String = typesDS.types[indexPath.row].name.capitalized
       cell.textLabel?.text = "Hello"
//
//       guard let image: UIImage = UIImage(named: typesDS.types[indexPath.row].name) else { return cell }
//
//       cell.imageView?.image = image
   
       return cell
   }
   
    
}
