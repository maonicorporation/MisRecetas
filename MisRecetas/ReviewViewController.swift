//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by EMILIO PARRILLA CORONADO on 23/3/17.
//  Copyright © 2017 EMILIO PARRILLA CORONADO. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

	@IBOutlet weak var stackView: UIStackView!
	@IBOutlet weak var backgroundImage: UIImageView!
	var strRating : String?
    override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let blueEfect = UIBlurEffect(style: .light)
		let bluerEfectView = UIVisualEffectView(effect: blueEfect)
		
		bluerEfectView.frame = view.bounds
		backgroundImage.addSubview(bluerEfectView)
		
		
		let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
		let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
		stackView.transform = scale.concatenating(translation)
		
		
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewDidAppear(_ animated: Bool)
	{
	/*	UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
			
			self.stackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			
		}, completion: nil)
*/
		
		UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations:
		{
			self.stackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}, completion: nil)
	}
	
	
	@IBAction func ratingPress(_ sender: UIButton)
	{
		switch sender.tag {
		case 1:
			strRating = "dislike"
		case 2:
			strRating = "good"
		case 3:
			strRating = "great"
		default:
			break;
		}
		
		performSegue(withIdentifier: "unwindDetailView", sender: sender)
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
