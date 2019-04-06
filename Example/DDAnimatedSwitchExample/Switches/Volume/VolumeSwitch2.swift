//
//  VolumeSwitch2.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class VolumeSwitch2: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        offTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        cornerRadius = 0.5
        thumbCornerRadius = 0.5
        thumbTintColor = UIColor.black
        padding = frame.size.height / 20
        let side = frame.size.height - 2 * padding
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        innerShadowColor = UIColor.black
        innerShadowRadius = 7
        innerShadowOpacity = 0.5
        
        thumbAnimationName = "VolumeAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
