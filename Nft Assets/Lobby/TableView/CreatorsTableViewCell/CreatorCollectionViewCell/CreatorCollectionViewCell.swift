//
//  CreatorCollectionViewCell.swift
//  Nft App
//
//  Created by Ben Seferidis on 8/11/22.
//

import UIKit

class CreatorCollectionViewCell: UICollectionViewCell {
    //MARK: - IBProperties
    @IBOutlet var creatorImg: UIImageView!
    @IBOutlet var creatorName: UILabel!
    
    //MARK: - Properties
    var nft : Nft?
    var creators : [Creator] = []
    let containerView = UIView()
    //MARK: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCollectionViewCell(_ creators : Creator) {
        
        creatorName.text = creators.user.username
        creatorName.layer.cornerRadius = 5
        creatorName.clipsToBounds = true
        let imgUrl = (creators.profileImgURL)
        creatorImg.downloaded(from: imgUrl)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.65
        layer.shadowRadius = 10
        layer.cornerRadius = frame.height/3
        layer.cornerRadius = frame.width/3
        
        func renewCreators( _ creators: [Creator]) {
            self.creators = creators
        }
    }
    
    
    
}
//MARK: - Protocols

protocol CreatorCollectionViewCellDelegate: AnyObject {
    func didSelectPhoto(index: Int)
}
