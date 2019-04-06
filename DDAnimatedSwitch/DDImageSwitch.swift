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

open class DDImageSwitch: DDSwitch {
    
    /// MARK: - Public VARs
    
    /*
     The image if thumb is On
     Default is nil
     */
    open var onImageView: UIImageView? {
        didSet {
            resetImages()
        }
    }
    
    /*
     The image if thumb is Off
     Default is nil
     */
    open var offImageView: UIImageView? {
        didSet {
            resetImages()
        }
    }
    
    /// MARK: - Life Cicle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        resetImages()
    }
    
    /// MARK: - Private
    
    override func additionalAnimation() {
        super.additionalAnimation()
        updateImagePositions()
    }
    
    private func resetImages() {
        guard let onImageView = onImageView else {
            return
        }
        guard let offImageView = offImageView else {
            return
        }
        clearImages()
        updateImagePositions()
        
        imageView.addSubview(onImageView)
        imageView.addSubview(offImageView)
    }
    
    private func updateImagePositions() {
        guard let onImageView = onImageView else {
            return
        }
        guard let offImageView = offImageView else {
            return
        }
        let openWidth: CGFloat = frame.size.width - thumb.bounds.size.width - 2 * padding
        let xImageViewOn = thumb.frame.origin.x - openWidth/2 - onImageView.bounds.width/2
        let xImageViewOff = thumb.frame.origin.x + thumb.frame.size.width + openWidth/2 - offImageView.bounds.width/2
        
        onImageView.center.y = thumb.center.y
        offImageView.center.y = thumb.center.y
        onImageView.frame.origin.x = xImageViewOn
        offImageView.frame.origin.x = xImageViewOff
    }
    
    private func clearImages() {
        if let onImageView = onImageView {
            onImageView.removeFromSuperview()
        }
        if let offImageView = offImageView {
            offImageView.removeFromSuperview()
        }
    }
}
