//
//  TickSwitch.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class TickSwitch: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = UIColor.white
        offTintColor = UIColor.magenta
        
        cornerRadius = 0.25
        thumbTintColor = UIColor.clear
        padding = -5
        let side = frame.size.height + 10
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbAnimationName = "TickAnimation"
        
        innerShadowColor = UIColor.black
        innerShadowRadius = 7
        innerShadowOpacity = 0.5
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
