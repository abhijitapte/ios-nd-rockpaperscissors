//
//  RPSMatchViewController.swift
//  RockPaperScissors
//
//  Created by Abhijit Apte on 12/03/21.
//

import UIKit

class RPSMatchViewController: UIViewController {
	enum Turn: Int {
		case rock
		case paper
		case scissors
	}
	
	var yourTurn: Turn?
	@IBOutlet weak var result: UILabel!
	@IBOutlet weak var resultVisual: UIImageView!
	
	func randomTurn() -> Turn {
		let turn = Turn(rawValue: Int(arc4random() % 3))!
		return turn
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	override func viewWillAppear(_ animated: Bool) {
		if let yourTurn = self.yourTurn {
			let opponentTurn = randomTurn()
			var result = ""
			var resultVisual: UIImage?
			
			if yourTurn == opponentTurn {
				result = "It's a tie"
				resultVisual = UIImage(named: "itsATie")
			} else if yourTurn == .rock {
				if opponentTurn == .paper {
					result = "paper covers rock, you lose"
					resultVisual = UIImage(named: "PaperCoversRock")
				} else if opponentTurn == .scissors {
					result = "rock crushes scissors, you win"
					resultVisual = UIImage(named: "RockCrushesScissors")
				}
			} else if yourTurn == .paper {
				if opponentTurn == .rock {
					result = "paper covers rock, you win"
					resultVisual = UIImage(named: "PaperCoversRock")
				} else if opponentTurn == .scissors {
					result = "scissors cut paper, you lose"
					resultVisual = UIImage(named: "ScissorsCutPaper")
				}
			} else if yourTurn == .scissors {
				if opponentTurn == .paper {
					result = "scissors cut paper, you win"
					resultVisual = UIImage(named: "ScissorsCutPaper")
				} else if opponentTurn == .rock {
					result = "rock crushes scissors, you lose"
					resultVisual = UIImage(named: "RockCrushesScissors")
				}
			}
			
			self.result.text = result
			self.resultVisual.image = resultVisual
		}
	}

	@IBAction func playAgain(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
