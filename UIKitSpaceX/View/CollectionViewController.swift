//
//  CollectionViewController.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 28.07.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let identifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}
