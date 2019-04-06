//
//  YesNoSwitch2.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class YesNoSwitch2: DDAnimatedSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = #colorLiteral(red: 0.2626093491, green: 0.5963204794, blue: 1, alpha: 1)
        offTintColor = #colorLiteral(red: 1, green: 0.6866612402, blue: 0.6857920676, alpha: 1)
        
        cornerRadius = 0.5
        thumbTintColor = UIColor.clear
        padding = frame.size.height / 20
        let side = frame.size.height - 2 * padding
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbAnimationName = "YesNoAnimation"
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
