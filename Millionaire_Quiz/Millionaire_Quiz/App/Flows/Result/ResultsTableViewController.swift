//
//  ResultsTableViewController.swift
//  Millionaire_Quiz
//
//  Created by Alexander Grigoryev on 20.12.2021.
//

import UIKit
import Foundation

class ResultsTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ResultsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameSingleton.shared.gameSession.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath)
        let data = gameSingleton.shared.gameSession[indexPath.row].numberOfAnsweredQuestions
        let data2 = gameSingleton.shared.resultPercent[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        var content = cell.defaultContentConfiguration()
        content.text = "Game results: \(data) (Completed: \(String(describing: data2.description))%)"
        //        content.secondaryText = dateFormatter.string(from: data.date)
        cell.contentConfiguration = content
        return cell
    }
}

extension ResultsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true)}
    }
}

