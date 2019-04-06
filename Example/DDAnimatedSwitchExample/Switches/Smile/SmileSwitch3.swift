//
//  SmileSwitch3.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class SmileSwitch3: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = UIColor.white
        offTintColor = UIColor.white
        
        cornerRadius = 0.5
        thumbTintColor = UIColor.clear
        padding = frame.size.height / 6
        let side = frame.size.height - 2 * padding
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbShadowColor = UIColor.black
        thumbShadowOffset = CGSize(width: 2.75, height: 5)
        thumbShadowRadius = 2
        thumbShadowOpacity = 0.3
        
        innerShadowColor = UIColor.black
        innerShadowRadius = 6
        innerShadowOpacity = 0.4
        
        thumbAnimationName = "SmileAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
