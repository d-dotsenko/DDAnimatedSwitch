//
//  ForestSwitch.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class ForestSwitch: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cornerRadius = 0.3
        thumbTintColor = UIColor.clear
        padding = frame.size.height / 10
        let side = frame.size.height / 1.2
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbShadowColor = UIColor.black
        thumbShadowOffset = CGSize(width: -2.75, height: -5)
        thumbShadowRadius = 5
        thumbShadowOpacity = 1
        
        thumbAnimationName = "BirdAnimation"
        backgroundAnimationName = "ForestAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
