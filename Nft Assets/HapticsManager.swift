//
//  HapticsManager.swift
//  Nft App
//
//  Created by Ben Seferidis on 11/11/22.
//

import UIKit

final class HapticsManager {
    static let shared = HapticsManager()
    
    private init() {}
    
    public func selectionVibrate(){
        DispatchQueue.main.async {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            //tell the feedback generator that the func happen so play appropriate the vibration for it
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    public func vibrateTxt(for type: UINotificationFeedbackGenerator.FeedbackType){
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
            //we call the vibrtaeTxt by type : HapticsManager. shared.vibrateTxt(for: .success)
        }
    }
}

