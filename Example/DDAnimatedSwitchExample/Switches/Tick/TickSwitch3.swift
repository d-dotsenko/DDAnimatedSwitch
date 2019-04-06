//
//  TickSwitch3.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class TickSwitch3: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = #colorLiteral(red: 0.8335259832, green: 1, blue: 0.792641209, alpha: 1)
        offTintColor = #colorLiteral(red: 0.2647153083, green: 1, blue: 0.1759441813, alpha: 1)
        
        cornerRadius = 0.25
        thumbTintColor = UIColor.clear
        padding = -5
        let side = frame.size.height + 10
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbShadowColor = UIColor.clear
        thumbShadowOffset = CGSize(width: 2.75, height: 5)
        thumbShadowRadius = 2
        thumbShadowOpacity = 0.3
        
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
