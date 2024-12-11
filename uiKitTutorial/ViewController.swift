//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = layout()
    }
    func layout() -> UICollectionViewCompositionalLayout{
        // item layout
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.2),
            heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group layout
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(50))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(20)
        
        // section layout
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 50
        
        // layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // config
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 200
        layout.configuration = config
        
        return layout
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReusable", for: indexPath) as! MyCollectionViewCell
        
        cell.backgroundColor = UIColor.systemCyan
        cell.label.text = String(indexPath.item)
        
        return cell
    }
    
    
}
