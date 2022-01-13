//
//  ViewController.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 18.12.2021.
//

import UIKit

class MenuViewController: UIViewController  {
    

    @IBOutlet var gameModeControl: UISegmentedControl!
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var lastResultLabel: UILabel!
    var answeredQuestions: Int = 0
    private var gameMode: SwitchGameMode {
        switch self.gameModeControl.selectedSegmentIndex {
        case 0:
            return .standard
        case 1:
            return .random
        default:
            return .standard
        }
    }
    weak var delegate: GameDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameFlowViewController else { return }
            destination.gameMode = self.gameMode
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




