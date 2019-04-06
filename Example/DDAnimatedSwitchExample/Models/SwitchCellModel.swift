//
//  SwitchCellModel.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

class SwitchCellModel: NSObject {
    
    var bigSwitch: DDSwitch
    var mediumSwitch: DDSwitch
    var smallSwitch: DDSwitch
    
    var titleStr: String?
    
    init(bigSwitch: DDSwitch, mediumSwitch: DDSwitch, smallSwitch: DDSwitch) {
        self.bigSwitch = bigSwitch
        self.mediumSwitch = mediumSwitch
        self.smallSwitch = smallSwitch
        
        super.init()
    }
}
