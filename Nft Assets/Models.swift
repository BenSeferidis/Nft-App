//
//  Models.swift
//  Nft Assets
//
//  Created by Ben Seferidis on 12/10/22.
//

import Foundation
// MARK: - Nft
struct Nft: Codable{
    let id:Int
    let image_url:String
    let name:String
    let creator: Creator
}

// MARK: - Icon
struct Icon:Codable{
    let image_url:String
}

// MARK: - Creator
struct Creator: Codable {
    let user: User
    let profileImgURL: String
 
    enum CodingKeys: String, CodingKey {
        case user
        case profileImgURL = "profile_img_url"
    }
}

// MARK: - User
struct User: Codable {
    let username: String?
}
