//
//  CollectionViewController.swift
//  Nft Assets
//
//  Created by Ben Seferidis on 4/11/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    let creatorsCellId = "creatorsCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        func setupCollectionView() {
            collectionView?.showsHorizontalScrollIndicator = false
            collectionView?.backgroundColor = .lightGray
            let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: creatorsCellId)
            collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        }
    }

}
extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: creatorsCellId, for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: view.frame.height-60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}


