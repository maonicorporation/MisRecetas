//
//  DetailViewController.swift
//  MisRecetas
//hjhkhkjh
//  Created by EMILIO PARRILLA CORONADO on 19/3/17.
//  Copyright © 2017 EMILIO PARRILLA CORONADO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var imageDetailView: UIImageView!
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var ratingButton: UIButton!
	
	var objReceta : Receta!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.estimatedRowHeight = 44;
		self.tableView.rowHeight = UITableViewAutomaticDimension
		
		self.title = objReceta.name

        self.imageDetailView.image = objReceta.imagen
		
		self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
		
		self.tableView.tableFooterView = UIView(frame : CGRect.zero)
		
		self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
		
	
    }
	
	@IBAction func close(segue : UIStoryboardSegue)
	{
		if let reviewVC = segue.source as? ReviewViewController
		{
			if let rating = reviewVC.strRating
			{
				let image = UIImage(named: rating)
				ratingButton.setImage(image, for: .normal)
				
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnSwipe = false
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController : UITableViewDelegate
{
	
}

extension DetailViewController : UITableViewDataSource
{
	func numberOfSections(in tableView: UITableView) -> Int
	{
		return 3
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		switch section {
		case 0:
			return 3
		case 1:
			return objReceta.ingredientes.count
		case 2:
			return objReceta.pasos.count
		default:
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailViewCell
		
		cell.backgroundColor = UIColor.clear
		
		switch indexPath.section
		{
		case 0:
			switch indexPath.row
			{
			case 0:
				cell.lbTitulo.text = "Nombre:"
				cell.lbTime.text = self.objReceta.name!
				
			case 1:
				cell.lbTitulo.text = "Tiempo:"
				cell.lbTime.text = "\(self.objReceta.time!)"
				
			case 2:
				cell.lbTitulo.text = "Favorita:"
				if objReceta.isFavourite
				{
					cell.lbTime.text = "Si"
				}
				else
				{
					cell.lbTime.text = "No"
				}
				
			default:
				break
				
			}
		case 1:
			if indexPath.row == 0
			{
				cell.lbTitulo.text = "Ingredientes :"
			}
			else
			{
				cell.lbTitulo.text = ""
			}
			cell.lbTime.text = objReceta.ingredientes[indexPath.row]
		
		case 2:
			if indexPath.row == 0
			{
				cell.lbTitulo.text = "Pasos :"
			}
			else
			{
				cell.lbTitulo.text = ""
			}
			cell.lbTime.text = objReceta.pasos[indexPath.row]
			
		default:
			break

		}

		return cell
	
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
	{
		var title = ""
		switch section
		{
		
		case 1:
			title =  "Ingredientes"
		case 2:
			title = "Pasos"
		default:
			break
		}
		return title

	}
}
