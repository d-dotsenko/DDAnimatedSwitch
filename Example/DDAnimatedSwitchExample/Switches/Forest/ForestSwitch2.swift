//
//  ForestSwitch2.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class ForestSwitch2: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        offTintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        cornerRadius = 0.5
        thumbTintColor = UIColor.clear
        padding = frame.size.height / 20
        let side = frame.size.height / 1.3
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbShadowColor = UIColor.white
        thumbShadowOffset = CGSize(width: 0, height: 0)
        thumbShadowRadius = 3
        thumbShadowOpacity = 1
        
        innerShadowColor = UIColor.black
        innerShadowRadius = 7
        innerShadowOpacity = 0.5
        
        thumbAnimationName = "BirdAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
