//
//  CircleSwitch3.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class CircleSwitch3: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = UIColor.clear
        offTintColor = UIColor.clear
        
        cornerRadius = 0.5
        thumbTintColor = UIColor.clear
        let side = frame.size.height
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbAnimationName = "CircleAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
