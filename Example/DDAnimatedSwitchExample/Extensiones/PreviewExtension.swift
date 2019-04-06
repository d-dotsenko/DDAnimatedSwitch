//
//  PreviewExtension.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import Foundation
import DDAnimatedSwitch

protocol PreviewDDSwitchProtocol: class {
    var isPreview: Bool { get set }
}

extension PreviewDDSwitchProtocol where Self: DDSwitch {
    var isPreview: Bool {
        get {
            return false
        }
        set {
            if newValue == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                    self?.changeSwitch()
                }
            }
        }
    }
    
    func changeSwitch() {
        isOn = !isOn
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 + Double(duration)) { [weak self] in
            self?.changeSwitch()
        }
    }
}
