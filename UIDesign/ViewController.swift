//
//  ViewController.swift
//  UIDesign
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var images = ["image1", "image2", "image3"]
    private var isByRoomSelected = true
    private var roomsDataCount = 6
    private var ratesDataCount = 5
    
    private enum CellTypes: String, CaseIterable {
        case AddressCell, SliderCell, OptionsCell, MenuCell, RoomCell, RateCell
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
        guard section == 4
        else { return 1 }
        return isByRoomSelected ? roomsDataCount: ratesDataCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return createAddressCell(indexPath)
        case 1: return createSliderCell(indexPath)
        case 2: return createOptionsCell(indexPath)
        case 3: return createMenuCell(indexPath)
        case 4: return isByRoomSelected ? createRoomCell(indexPath): createRateCell(indexPath)
        default: return UITableViewCell()
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 108
        case 1: return 236
        case 2: return 80
        case 3: return 60
        case 4: return isByRoomSelected ? 300: 270
        default: return 0
        }
    }
}


// MARK: - Menu Delegate

extension ViewController: MenuChanging {
    
    func menuDidChange(index: Int) {
        isByRoomSelected = index == 0
        tableView.reloadSections(IndexSet(integer: 4), with: .automatic)
    }
    
    
}

// MARK: - Table View Cells

extension ViewController {
    
    private func createAddressCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.AddressCell.rawValue, for: indexPath) as? AddressCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func createSliderCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.SliderCell.rawValue, for: indexPath) as? SliderCell else {
            return UITableViewCell()
        }
        cell.setData(images: images)
        return cell
    }
    
    private func createOptionsCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.OptionsCell.rawValue, for: indexPath) as? OptionsCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func createMenuCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.MenuCell.rawValue, for: indexPath) as? MenuCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
    
    private func createRoomCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.RoomCell.rawValue, for: indexPath) as? RoomCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func createRateCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.RateCell.rawValue, for: indexPath) as? RateCell else {
            return UITableViewCell()
        }
        return cell
    }
}

