//
//  ViewController.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 18.12.2021.
//

import UIKit

class MenuViewController: UIViewController  {
    
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var lastResultLabel: UILabel!
    var answeredQuestions: Int = 0
    
    weak var delegate: GameDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameFlowViewController else { return }
            destination.gameDelegate = self
        default:
            break
        }
    }
    override func viewDidLoad() {
        let vc = GameFlowViewController()
        vc.gameDelegate = self
        super.viewDidLoad()
    }
    
    @IBAction func launchGame(_ sender: Any) {}
}

extension MenuViewController: GameDelegate {
    func didEndGame(withResult result: Int) {
        self.delegate?.didEndGame(withResult: result)
        self.dismiss(animated: true, completion: nil)
        self.lastResultLabel.text = "The last result: \(result)"
    }
}




