//
//  DetailViewCell.swift
//  MisRecetas
//
//  Created by EMILIO PARRILLA CORONADO on 20/3/17.
//  Copyright © 2017 EMILIO PARRILLA CORONADO. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell {

	@IBOutlet weak var lbTime: UILabel!
	@IBOutlet weak var lbTitulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	

}
