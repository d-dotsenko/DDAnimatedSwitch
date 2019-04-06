//
//  CitySwitch.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class CitySwitch: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = UIColor.cyan
        offTintColor = UIColor.yellow
        
        cornerRadius = 0.2
        thumbTintColor = UIColor.clear
        padding = frame.size.height / 10
        let side = frame.size.height / 1.5
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbShadowColor = UIColor.black
        thumbShadowOffset = CGSize(width: 2.75, height: 5)
        thumbShadowRadius = 2
        thumbShadowOpacity = 1
        
        thumbImage = UIImage(named: "late")
        backgroundAnimationName = "CityAnimation"
        isThumbImageColorAnimate = true
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
