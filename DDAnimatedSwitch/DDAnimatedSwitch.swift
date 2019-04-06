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

import Foundation

open class DDAnimatedSwitch: DDSwitch {
    
    /// MARK: - Public VARs
    
    /*
     The name of plist with names of frame images for thumb animation
     */
    open var thumbAnimationName: String? {
        didSet {
            setupFrameAnimation()
        }
    }
    
    /*
     The name of plist with names of frame images for switch animation
     */
    open var backgroundAnimationName: String? {
        didSet {
            setupFrameAnimation()
        }
    }
    
    /// MARK: - Private VARs
    
    private var animationThumbImages: Array<CGImage> = Array()
    private var animationBackgroundImages: Array<CGImage> = Array()
    
    // MARK: Private methods
    
    override func setupThumbImage() {
        if let image = thumbImage, !(thumbAnimationName?.count ?? 0 > 0) {
            thumb.imageView.image = image
            thumb.imageView.contentMode = .scaleAspectFit
            thumb.imageView.clipsToBounds = true
            if isThumbImageColorAnimate {
                self.thumb.imageView.image = self.thumb.imageView.image?.withRenderingMode(.alwaysTemplate)
                self.thumb.imageView.tintColor = self._isOn ? self.offTintColor : self.onTintColor
            }
        }
    }
    
    override func animate() {
        playFrameAnimation()
        playSwitchAnimation()
    }
    
    override func setup() {
        super.setup()
        
        setupFrameAnimation()
    }
    
    private func playFrameAnimation() {
        if _isOn {
            frameAnimation(duration: duration, isReverse: true)
        } else {
            frameAnimation(duration: duration, isReverse: false)
        }
    }
    
    private func setupFrameAnimation() {
        setupThumbFrameAnimation()
        setupBackgroundFrameAnimation()
    }
    
    private func setupThumbFrameAnimation() {
        guard let animationName = thumbAnimationName else {
            return
        }
        let bundle = Bundle.main
        guard let path = bundle.path(forResource: animationName, ofType: "plist") else {
            return
        }
        guard case let animationImagesName as [String] = NSArray(contentsOfFile: path) else {
            return
        }
        animationThumbImages = createImagesArray(animationImagesName, bundle: bundle)
        if let imageName = _isOn ? animationImagesName.last : animationImagesName.first {
            thumb.imageView.image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
            thumb.imageView.contentMode = .scaleAspectFit
        }
    }
    
    private func setupBackgroundFrameAnimation() {
        guard let animationName = backgroundAnimationName else {
            return
        }
        let bundle = Bundle.main
        guard let path = bundle.path(forResource: animationName, ofType: "plist") else {
            return
        }
        guard case let animationImagesName as [String] = NSArray(contentsOfFile: path) else {
            return
        }
        animationBackgroundImages = createImagesArray(animationImagesName, bundle: bundle)
        if let imageName = _isOn ? animationImagesName.last : animationImagesName.first {
            imageView.image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
            imageView.contentMode = .scaleAspectFill
        }
    }
    
    private func createImagesArray(_ imageNames: Array<String>, bundle: Bundle) -> Array<CGImage> {
        var images: Array<CGImage> = Array()
        for name: String in imageNames {
            if let image = UIImage(named: name, in: bundle, compatibleWith: nil)?.cgImage {
                images.append(image)
            }
        }
        return images
    }
    
    private func frameAnimation(duration: CGFloat, isReverse: Bool) {
        if animationThumbImages.count > 0 {
            let images = isReverse ? animationThumbImages.reversed() : animationThumbImages
            playFrameAnimation(for:thumb, images: images, duration: duration)
        }
        if animationBackgroundImages.count > 0 {
            let images = isReverse ? animationBackgroundImages.reversed() : animationBackgroundImages
            playFrameAnimation(for:self, images: images, duration: duration)
            layer.contentsGravity = CALayerContentsGravity.resizeAspectFill
            layer.masksToBounds = true
        }
    }
    
    private func playFrameAnimation(for view: UIView, images: Array<CGImage>, duration: CGFloat) {
        let frameAnimation = CAKeyframeAnimation(keyPath: "contents")
        frameAnimation.delegate = self
        frameAnimation.calculationMode = CAAnimationCalculationMode.linear
        frameAnimation.duration = TimeInterval(duration)
        frameAnimation.values = images
        frameAnimation.repeatCount = 1
        frameAnimation.isRemovedOnCompletion = false
        frameAnimation.fillMode = CAMediaTimingFillMode.forwards
        view.layer.add(frameAnimation, forKey: nil)
    }
    
    private func updateStaticImageForAimation(view: UIView, stop: Bool) {
        view.subviews
            .lazy
            .filter { $0 is UIImageView }
            .forEach { $0.isHidden = !stop }
    }
}

extension DDAnimatedSwitch: CAAnimationDelegate {
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let cgImageThumb = _isOn ? animationThumbImages.last : animationThumbImages.first {
            thumb.imageView.image = UIImage(cgImage: cgImageThumb)
            updateStaticImageForAimation(view: thumb, stop: true)
        }
        if let cgImageBackground = _isOn ? animationBackgroundImages.last : animationBackgroundImages.first {
            imageView.image = UIImage(cgImage: cgImageBackground)
            updateStaticImageForAimation(view: self, stop: true)
        }
    }
    
    public func animationDidStart(_ anim: CAAnimation) {
        if animationThumbImages.count > 0 {
            updateStaticImageForAimation(view: thumb, stop: false)
        }
        if animationBackgroundImages.count > 0 {
            updateStaticImageForAimation(view: self, stop: false)
        }
    }
}
