/*
 The MIT License (MIT)
 
 Copyright (c) 2019 Dmitriy Dotsenko
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

open class DDLabelSwitch: DDSwitch {
    
    /// MARK: - Public VARs
    
    /*
     The label if thumb is On
     Default is nil
     */
    open var onLabel: UILabel? {
        didSet {
            resetLabels()
        }
    }
    
    /*
     The label if thumb is Off
     Default is nil
     */
    open var offLabel: UILabel? {
        didSet {
            resetLabels()
        }
    }
    
    /// MARK: - Life Cicle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        resetLabels()
    }
    
    /// MARK: - Private
    
    override func additionalAnimation() {
        super.additionalAnimation()
        updateLabelPositions()
    }
    
    private func resetLabels() {
        guard let onLabel = onLabel else {
            return
        }
        guard let offLabel = offLabel else {
            return
        }
        clearLabels()
        updateLabelPositions()
        
        imageView.addSubview(onLabel)
        imageView.addSubview(offLabel)
    }
    
    private func updateLabelPositions() {
        guard let onLabel = onLabel else {
            return
        }
        guard let offLabel = offLabel else {
            return
        }
        onLabel.sizeToFit()
        offLabel.sizeToFit()
        let openWidth: CGFloat = frame.size.width - thumb.bounds.size.width - 2*padding
        let xLabelOn = thumb.frame.origin.x - openWidth/2 - onLabel.bounds.width/2
        let xLabelOff = thumb.frame.origin.x + thumb.frame.size.width + openWidth/2 - offLabel.bounds.width/2
        
        onLabel.center.y = thumb.center.y
        offLabel.center.y = thumb.center.y
        onLabel.frame.origin.x = xLabelOn
        offLabel.frame.origin.x = xLabelOff
    }
    
    private func clearLabels() {
        if let onLabel = onLabel {
            onLabel.removeFromSuperview()
        }
        if let offLabel = offLabel {
            offLabel.removeFromSuperview()
        }
    }
}
