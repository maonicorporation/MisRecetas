//
//  ViewController.swift
//  MisRecetas
//
//  Created by EMILIO PARRILLA CORONADO on 5/3/17.
//  Copyright © 2017 EMILIO PARRILLA CORONADO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController
{
    
    var listaRecetas : [Receta] = []
    
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
		
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		
		//self.tableView.estimatedRowHeight = 44;
		//self.tableView.rowHeight = UITableViewAutomaticDimension fdfdfdf
		
		
		
        
        var receta = Receta(name: "Tortilla de patatas ddfdf",image: #imageLiteral(resourceName: "tortillaPatatas"),time : 9,
                            ingredientes : ["Patatas","Huevos","Cebollas"],
                            pasos : ["Pelar patatas","cortar","freir"])
        
        listaRecetas.append(receta)
        
        receta = Receta(name: "Pizza Margarita",image: #imageLiteral(resourceName: "pizzaMargarita"),time : 20,
                        ingredientes : ["albahaca","tomate","masa"],
                        pasos : ["Comprar","Hornear","servir"])
        
        listaRecetas.append(receta)
        
        receta = Receta(name: "Hamburguesa Queso",image: #imageLiteral(resourceName: "HamburguesaQueso"),time : 15,
                        ingredientes : ["Hamburguesa","Queso","Cebollas"],
                        pasos : ["Freir ","Poner Queso","Servir"])
        
        listaRecetas.append(receta)
        
        receta = Receta(name: "Ensalada Cesar",image: #imageLiteral(resourceName: "ensaladaCesar"),time : 12,
                        ingredientes : ["ensalada","picatostes","pollo"],
                        pasos : ["Cortar ensalada","salsa","emplatar"])
        
        listaRecetas.append(receta)
        
     //   self.navigationController?.hidesBarsOnSwipe = YES;
        
        
        
     
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnSwipe = true
	}
	
  

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.listaRecetas.count
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let obj = listaRecetas[indexPath.row]
        let cellID = "recetaCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CellReceta
        
        cell.lblTitulo.text = obj.name
        cell.imagenCell.image = obj.imagen
        cell.lblTime.text = "\(obj.time) min"
        cell.lblIngredientes.text = "\(obj.ingredientes.count) ingredientes"
        
        cell.imagenCell.layer.cornerRadius = 42
        cell.imagenCell.clipsToBounds = true
		
		if (obj.isFavourite == true)
		{
			cell.accessoryType = .checkmark
		}
		else
		{
			cell.accessoryType = .none
		}
        return cell
        
    }
    
    //MARK: UITABLEVIEDELEGATE
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
	/*	let recipe = self.listaRecetas[indexPath.row]
		let alertController = UIAlertController(title: recipe.name, message: "Valora la receta", preferredStyle: .actionSheet)
		var strFavorito = "Favorito"
		if (recipe.isFavourite == true)
		{
			strFavorito = "Quitar de Favorito"
		}
		
		let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
		let favouriteAction = UIAlertAction(title: strFavorito, style: .default) { (action) in
			
			recipe.isFavourite = !recipe.isFavourite
			self.tableView.reloadData()
		}
		alertController.addAction(favouriteAction)
		alertController.addAction(cancelAction)
		self.present(alertController, animated: true, completion: nil)
*/
    }
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		
		if (editingStyle == .delete)
		{
			self.listaRecetas.remove(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	
	override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
	{
		let shareAction = UITableViewRowAction(style: .default, title : "Compartir") { (action, indexPath) in
			
			let strDefaultText = "Estoy mirando la receta \(self.listaRecetas[indexPath.row].name!) en la app del curos de IOS 10"
			
			let activityController = UIActivityViewController(activityItems: [strDefaultText,self.listaRecetas[indexPath.row].imagen], applicationActivities: nil)
			
			self.present(activityController, animated: true, completion: nil)
		}
		
		let borrarction = UITableViewRowAction(style: .default, title : "Borrar") { (action, indexPath) in
			
			self.listaRecetas.remove(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with: .fade)
		}

		shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255, blue: 253.0/255.0, alpha: 1)
		borrarction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255, blue: 202.0/255.0, alpha: 1)
		
		return [shareAction,borrarction]
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		if (segue.identifier == "segueDetail")
		{
			if let indexPath = self.tableView.indexPathForSelectedRow
			{
				let obj = listaRecetas[indexPath.row]
				let destinationViewController = segue.destination as! DetailViewController
				destinationViewController.objReceta = obj
				
				
			}
		}
	}
	
}

