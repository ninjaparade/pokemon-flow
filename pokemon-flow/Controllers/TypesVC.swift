//
//  LandingVC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit


 // Mark: Delegate

protocol PokemonTypeDelegate: class {
    func didTapType(_ typeVC: TypesVC, pokemonType: Type)
}

class TypesVC: BaseTableVC {
    
    weak var delegate: PokemonTypeDelegate?
    
    init(context: AppContext, typesDS: TypesDS) {
        super.init(context: context, dataSource: typesDS)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Types"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let typesDS = dataSource as? TypesDS else { return cell }
        let name: String = typesDS.types[indexPath.row].name.capitalized
        cell.textLabel?.text = "\(name)"
            
        guard let image: UIImage = UIImage(named: typesDS.types[indexPath.row].name) else { return cell }
        
        cell.imageView?.image = image
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pokemonTypeDS = dataSource as? TypesDS else { return }

        delegate?.didTapType(self, pokemonType: pokemonTypeDS.types[indexPath.row])
    }
}
