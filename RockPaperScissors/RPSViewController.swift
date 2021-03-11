//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Abhijit Apte on 12/03/21.
//

import UIKit

class RPSViewController: UIViewController {
	@IBOutlet weak var rock: UIButton!
	@IBOutlet weak var paper: UIButton!
	@IBOutlet weak var scissors: UIButton!
		
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	@IBAction func rockSelected(_ sender: Any) {
		let rpsMatchVC = self.storyboard?.instantiateViewController(identifier: "RPSMatchViewController") as! RPSMatchViewController
		rpsMatchVC.yourTurn = RPSMatchViewController.Turn.rock
		present(rpsMatchVC, animated: true, completion: nil)
	}
	
	@IBAction func paperSelected(_ sender: Any) {
		performSegue(withIdentifier: "showRPSMatchResult1", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let rpsMatchVC = segue.destination as! RPSMatchViewController
		if segue.identifier == "showRPSMatchResult1" {
			rpsMatchVC.yourTurn =  RPSMatchViewController.Turn.paper
		} else if segue.identifier == "showRPSMatchResult2" {
			rpsMatchVC.yourTurn = RPSMatchViewController.Turn.scissors
		}
	}
}

