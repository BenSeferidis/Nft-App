//
//  CreatorsTableViewCell.swift
//  Nft App
//
//  Created by Ben Seferidis on 1/11/22.
//

import UIKit

class CreatorsTableViewCell: UITableViewCell {
    
    //MARK: - IBProtperties
    @IBOutlet var creatorsCollectionView: UICollectionView!
    
    //MARK: - Properties
    var nft : Nft?
    var creators : [Creator] = []
    weak var delegate : CreatorsTableViewCellDelegate?
    
    //MARK: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
        creatorsCollectionView.dataSource = self
        creatorsCollectionView.delegate = self
        let nibName = UINib(nibName: "CreatorCollectionViewCell", bundle: nil)
        creatorsCollectionView.register(nibName, forCellWithReuseIdentifier: "CreatorCollectionViewCell.identifier")
        layer.cornerRadius = 15
        clipsToBounds = true
        layer.shadowColor = UIColor.systemGray6.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 15
    }
    
    func updateCreators( _ creators: [Creator]) {
        self.creators = creators
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: - Extensions

extension CreatorsTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width , height: collectionView.frame.height )
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return creators.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = creatorsCollectionView.dequeueReusableCell(withReuseIdentifier: "CreatorCollectionViewCell.identifier",
                                                              for: indexPath) as! CreatorCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        cell.layer.shadowColor = UIColor.systemGray6.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowOpacity = 0.8
        cell.layer.shadowRadius = 15
        cell.setUpCollectionViewCell(creators[indexPath.row])
        return cell
    }  
}

//MARK: - Protocols

protocol CreatorsTableViewCellDelegate: AnyObject {
    func didSelectPhoto(index: Int)
}
