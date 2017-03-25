//
//  CellReceta.swift
//  MisRecetas
//
//  Created by EMILIO PARRILLA CORONADO on 7/3/17.
//  Copyright © 2017 EMILIO PARRILLA CORONADO. All rights reserved.
//

import UIKit

class CellReceta: UITableViewCell {

    @IBOutlet weak var lblIngredientes: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var imagenCell: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
