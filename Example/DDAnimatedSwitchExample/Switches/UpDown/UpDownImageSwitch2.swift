//
//  PlayPauseImageSwitch.swift
//  DDAnimatedSwitchExample
//
//  Created by Доценко Дмитрий on 28/03/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class UpDownImageSwitch2: DDImageSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = UIColor.orange
        offTintColor = UIColor.lightGray
        
        cornerRadius = 0.1
        thumbCornerRadius = 0.1
        thumbTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        padding = frame.size.height / 50
        let side = frame.size.height - 2 * padding
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbShadowColor = UIColor.black
        thumbShadowOffset = CGSize(width: 0, height: 0)
        thumbShadowRadius = 3
        thumbShadowOpacity = 0.4
        
        innerShadowColor = UIColor.black
        innerShadowRadius = 7
        innerShadowOpacity = 0.5
        
        let imageViewOn = UIImageView(image: UIImage(named: "playWhite"))
        imageViewOn.contentMode = .scaleAspectFit
        imageViewOn.frame.size = CGSize(width: 30, height: 30)
        imageViewOn.layer.shadowColor = UIColor.black.cgColor
        imageViewOn.layer.shadowOffset = CGSize(width: 2, height: -2)
        imageViewOn.layer.shadowRadius = 3
        imageViewOn.layer.shadowOpacity = 0.4
        
        let imageViewOff = UIImageView(image: UIImage(named: "pauseBlack"))
        imageViewOff.contentMode = .scaleAspectFit
        imageViewOff.frame.size = CGSize(width: 30, height: 30)
        imageViewOff.layer.shadowColor = UIColor.black.cgColor
        imageViewOff.layer.shadowOffset = CGSize(width: 2, height: -2)
        imageViewOff.layer.shadowRadius = 3
        imageViewOff.layer.shadowOpacity = 0.2
        
        onImageView = imageViewOn
        offImageView = imageViewOff
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
