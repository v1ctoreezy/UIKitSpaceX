//
//  GridCollection.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 30.07.2022.
//

import UIKit

class GridCell: UITableViewCell   {
    
    static let identifer = "GridCell"
    let grid: UICollectionView
    var rocket: Rocket?
    var measureIndx = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 110)
        
        self.grid = UICollectionView(frame: .zero, collectionViewLayout: layout)
        grid.contentInset = UIEdgeInsets(top: 0, left: Constant.horizontalSpacing, bottom: 0, right: Constant.horizontalSpacing)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        grid.showsHorizontalScrollIndicator = false
        grid.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)

        grid.delegate = self
        grid.dataSource = self
        
        grid.backgroundColor = .black

        contentView.addSubview(grid)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        grid.frame = contentView.bounds
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GridCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let data = rocket?.gridData(indexPath: indexPath, mesurePick: measureIndx)
        cell.disrip.text = "\(MainRocketHelper.shared.titlesTable[indexPath.section][indexPath.row]), \(data!.1)"
        cell.data.text = data!.0.stringWithoutZeroFraction
        return cell
    }
}
