//
//  OpeningViewController.swift
//  Nft App
//
//  Created by Ben Seferidis on 10/11/22.
//

import UIKit
import ViewAnimator

class OpeningViewController: UIViewController {
    
    //MARK: - IBProperties
    @IBOutlet var openingImg: UIImageView!
    @IBOutlet var openingLbl: UILabel!
    @IBOutlet var startButton: UIButton!
    
    //MARK: - Properties
    var nft : Nft?
    
    //MARK:  - Life Cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        openingLbl.text = "NFT APP"
        let animation = AnimationType.from(direction: .top, offset: 50)
        openingImg.animate(animations: [animation] , delay: 0.3, duration: 2)
        openingImg.layer.shadowColor = UIColor.black.cgColor
        openingImg.layer.shadowOffset = CGSize(width: 0, height: 0)
        openingImg.layer.shadowOpacity = 0.65
        openingImg.layer.shadowRadius = 10
    }
    
    
    
    //MARK: - Methods
    @IBAction func startApp(_ sender: Any) {
        
        HapticsManager.shared.selectionVibrate()
        let storyBoard = UIStoryboard(name: "Lobby", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "LobbyViewController") as! LobbyViewController
        controller.modalTransitionStyle = .flipHorizontal
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}
