//
//  ViewController.swift
//  UIDesign
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private enum CellTypes: String, CaseIterable {
        case AddressCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        CellTypes.allCases.forEach {
            let nib = UINib(nibName: $0.rawValue, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: $0.rawValue)
        }
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return createAddressCell(indexPath)
        default: return UITableViewCell()
        }
    }
    
    
    private func createAddressCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.AddressCell.rawValue, for: indexPath) as? AddressCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        108
    }
}


extension ViewController {
    
}
