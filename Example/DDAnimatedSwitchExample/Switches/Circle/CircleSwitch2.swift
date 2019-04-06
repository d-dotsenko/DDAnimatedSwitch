//
//  CircleSwitch2.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class CircleSwitch2: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = #colorLiteral(red: 0.9568627477, green: 0.7980956424, blue: 0.739340403, alpha: 1)
        offTintColor = #colorLiteral(red: 0.9200015914, green: 0.9764705896, blue: 0.4688145569, alpha: 1)
        
        cornerRadius = 0.5
        thumbTintColor = UIColor.clear
        padding = frame.size.height / 10
        let side = frame.size.height - 2 * padding
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
