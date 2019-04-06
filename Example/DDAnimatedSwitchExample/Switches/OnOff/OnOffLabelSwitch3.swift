//
//  OnOffLabelSwitch3.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class OnOffLabelSwitch3: DDLabelSwitch, PreviewDDSwitchProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onTintColor = UIColor.purple
        offTintColor = UIColor.lightGray
        
        cornerRadius = 0.2
        thumbCornerRadius = 0.5
        thumbTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        padding = frame.size.height / -5
        let side = frame.size.height - 2 * padding
        thumbSize = CGSize(width: side, height: side)
        duration = 0.8
        
        thumbShadowColor = UIColor.black
        thumbShadowOffset = CGSize(width: 0, height: 0)
        thumbShadowRadius = 3
        thumbShadowOpacity = 0.7
        
        innerShadowColor = UIColor.black
        innerShadowRadius = 7
        innerShadowOpacity = 0.5
        
        let labelOn = UILabel()
        labelOn.textColor = UIColor.white
        labelOn.text = "On"
        labelOn.font = UIFont(name: labelOn.font.fontName, size: 24)
        labelOn.layer.shadowColor = UIColor.white.cgColor
        labelOn.layer.shadowOffset = CGSize(width: 2, height: -2)
        labelOn.layer.shadowRadius = 3
        labelOn.layer.shadowOpacity = 0.7
        
        let labelOff = UILabel()
        labelOff.textColor = UIColor.black
        labelOff.text = "Off"
        labelOff.font = UIFont(name: labelOff.font.fontName, size: 24)
        labelOff.layer.shadowColor = UIColor.black.cgColor
        labelOff.layer.shadowOffset = CGSize(width: 2, height: -2)
        labelOff.layer.shadowRadius = 3
        labelOff.layer.shadowOpacity = 0.2
        
        onLabel = labelOn
        offLabel = labelOff
        
        // just for preview
        isPreview = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
