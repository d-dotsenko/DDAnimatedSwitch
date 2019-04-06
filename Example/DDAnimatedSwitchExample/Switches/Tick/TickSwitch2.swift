//
//  TickSwitch2.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class TickSwitch2: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = #colorLiteral(red: 1, green: 0.9416162762, blue: 0.7352181199, alpha: 1)
        offTintColor = #colorLiteral(red: 1, green: 0.3529156984, blue: 0.3683450943, alpha: 1)
        
        cornerRadius = 0.25
        thumbTintColor = UIColor.clear
        padding = -3
        let side = frame.size.height + 6
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        innerShadowColor = UIColor.black
        innerShadowRadius = 7
        innerShadowOpacity = 0.5
        
        thumbAnimationName = "TickAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
