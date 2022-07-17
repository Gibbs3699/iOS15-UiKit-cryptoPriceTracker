//
//  CryptoViewController.swift
//  Crypto Price Tracker
//
//  Created by TheGIZzz on 12/7/2565 BE.
//

import UIKit

class CryptoViewController: UIViewController {
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        return formatter
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        
        title = "Crypto Price Tracker"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({ model in
                    let price = model.price_usd ?? 0
                    let formatter = CryptoViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    
                    let iconURL = URL(string: APICaller.shared.icons.filter({ icon in
                        icon.asset_id == model.asset_id
                    }).first?.url ?? "")
                    
                    return CryptoTableViewCellViewModel(name: model.name ?? "N/A", symbol: model.asset_id ?? "N/A", price: priceString ?? "N/A", iconURL: iconURL)
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK: - Table view data source
extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}


