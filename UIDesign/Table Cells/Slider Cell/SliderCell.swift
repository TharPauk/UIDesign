//
//  SliderCell.swift
//  UIDesign
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

@IBDesignable class SliderCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var paginationLabel: UILabel!
    private var images = [String]()
    private let slideCellId = "SlideCell"
    private let screenWidth = UIScreen.main.bounds.width
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: slideCellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: slideCellId)
    }
    
    func setData(images: [String]) {
        self.images = images
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: slideCellId, for: indexPath) as? SlideCell
        else { return UICollectionViewCell() }
        cell.setData(imageName: images[indexPath.item])
        return cell
    }
    
    
    

}

extension SliderCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = screenWidth - 56
        return CGSize(width: cellWidth, height: 200)
    }
    
}
