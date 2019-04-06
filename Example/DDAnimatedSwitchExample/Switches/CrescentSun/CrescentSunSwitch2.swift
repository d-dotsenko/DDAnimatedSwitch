//
//  CrescentSunSwitch2.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class CrescentSunSwitch2: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cornerRadius = 0.2
        thumbTintColor = UIColor.clear
        let side = frame.size.height
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8

        backgroundAnimationName = "SunMoonAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
