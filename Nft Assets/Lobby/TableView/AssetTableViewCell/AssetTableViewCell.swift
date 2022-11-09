//
//  AssetTableViewCell.swift
//  Nft App
//
//  Created by Ben Seferidis on 14/10/22.
//

import UIKit

class AssetTableViewCell: UITableViewCell {
    
    //MARK: - IBProperties
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var iconView : UIImageView!
    @IBOutlet var likesLabel: UILabel!
    
    //MARK: - Properties
    var nft:Nft?
    
    //MARK: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.layer.cornerRadius = nameLabel.frame.height/2
        nameLabel.layer.cornerRadius = 5
        nameLabel.clipsToBounds = true
        likesLabel.layer.cornerRadius = 5
        likesLabel.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
