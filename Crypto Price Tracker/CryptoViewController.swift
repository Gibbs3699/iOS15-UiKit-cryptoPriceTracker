//
//  CryptoViewController.swift
//  Crypto Price Tracker
//
//  Created by TheGIZzz on 12/7/2565 BE.
//

import UIKit

class CryptoViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        
        title = "Crypto"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        APICaller.shared.getAllCryptoData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK: - Table view data source
extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        
        cell.textLabel?.text = "dadads"
        
        return cell
    }
    
}


