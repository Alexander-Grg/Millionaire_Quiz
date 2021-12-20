//
//  ResultsTableViewController.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 20.12.2021.
//

import UIKit
import Foundation

class ResultsTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ResultsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameSingleton.shared.gameSession.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let result = gameSingleton.shared.gameSession[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        cell.textLabel?.text = dateFormatter.string(from: result.date)
        cell.detailTextLabel?.text = "\(String(describing: result.questionsDelegate))"
        
        return cell
    }
    
    
    
}

extension ResultsTableViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true)}
    }
}

