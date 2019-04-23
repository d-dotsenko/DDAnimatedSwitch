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

open class DDSwitch: UIControl {
    
    /// MARK: - Public VARs
    
    /*
     The switch value
     */
    open var isOn: Bool {
        get {
            return _isOn
        }
        set {
            if _isOn == newValue {
                return
            }
            if isAnimating {
                return
            }
            if window != nil {
                animate()
            } else {
                _isOn = newValue
                setup()
            }
        }
    }
    
    /*
     A Boolean value that determines whether switch changes are animated
     Default is true
     */
    open var animated: Bool = true {
        didSet {
            if animated == false {
                duration = 0
            }
        }
    }
    
    /*
     The animation duration value
     Default is 0
     */
    open var duration: CGFloat {
        get {
            return _duration
        }
        set {
            _duration = animated ? newValue : 0
        }
    }
    
    /*
     Minimum left/right thumb offset
     Default is 0
     */
    open var padding: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    /*
     The switch background color if thumb is On
     Default is UIColor.green
     */
    open var onTintColor: UIColor = UIColor.green {
        didSet {
            setup()
        }
    }
    
    /*
     The switch background color if thumb is Off
     Default is UIColor.lightGray
     */
    open var offTintColor: UIColor = UIColor.lightGray {
        didSet {
            setup()
        }
    }
    
    /*
     The thumb background color
     Default is UIColor.white
     */
    open var thumbTintColor: UIColor = UIColor.white {
        didSet {
            setup()
        }
    }
    
    /*
     The switch corner radius (0.0 ... 0.5)
     Default is 0.5
     */
    open var cornerRadius: CGFloat {
        get {
            return _cornerRadius
        }
        set {
            if newValue > 0.5 || newValue < 0.0 {
                _cornerRadius = 0.5
            } else {
                _cornerRadius = newValue
            }
        }
    }
    
    /*
     The thumb corner radius (0.0 ... 0.5)
     Default is 0.5
     */
    open var thumbCornerRadius: CGFloat {
        get {
            return _thumbCornerRadius
        }
        set {
            if newValue > 0.5 || newValue < 0.0 {
                _thumbCornerRadius = 0.5
            } else {
                _thumbCornerRadius = newValue
            }
        }
    }
    
    /*
     The thumb size
     Default is CGSize.zero
     */
    open var thumbSize: CGSize = CGSize.zero {
        didSet {
            layoutSubviews()
        }
    }
    
    /*
     The thumb image
     Default is nil
     */
    open var thumbImage: UIImage? = nil {
        didSet {
            setup()
        }
    }
    
    /*
     A Boolean value that determines whether thumb imageView tint color is
     inversed of the switch background color during animation   switch changes are animated
     Default is false
     */
    open var isThumbImageColorAnimate: Bool = false {
        didSet {
            setup()
        }
    }
    
    /*
     The thumb shadow color
     Default is UIColor.clear
     */
    open var thumbShadowColor: UIColor = UIColor.clear {
        didSet {
            setup()
        }
    }
    
    /*
     The thumb shadow offset
     Default is CGSize(width: 0.75, height: 2)
     */
    open var thumbShadowOffset: CGSize = CGSize(width: 0.75, height: 2) {
        didSet {
            setup()
        }
    }
    
    /*
     The thumb shadow radius
     Default is 1.5
     */
    open var thumbShadowRadius: CGFloat = 1.5 {
        didSet {
            setup()
        }
    }
    
    /*
     The thumb shadow opacity
     Default is 0.4
     */
    open var thumbShadowOpacity: Float = 0.4 {
        didSet {
            setup()
        }
    }
	
	/*
	 The thumb border color
	 Default is UIColor.lightGray
	*/
	open var thumbBorderColor: UIColor = UIColor.lightGray {
		didSet {
			setup()
		}
	}
	
	/*
	 The thumb border width
	 Default is 1
	*/
	open var thumbBorderWidth: CGFloat = 1 {
		didSet {
			setup()
		}
	}
    
    /*
     Inner shadow collor of the switch
     Default is UIColor.clear
     */
    open var innerShadowColor: UIColor = UIColor.clear {
        didSet {
            setup()
        }
    }
    
    /*
     Inner shadow radius of the switch
     Default is 1.5
     */
    open var innerShadowRadius: CGFloat = 1.5 {
        didSet {
            setup()
        }
    }
    
    /*
     Inner shadow opacity of the switch
     Default is 0.4
     */
    open var innerShadowOpacity: Float = 0.4 {
        didSet {
            setup()
        }
    }
    
    /// MARK: - Private VARs
    
    internal var _isOn: Bool = false
    internal var thumb = DDAnimatedThumbView(frame: CGRect.zero)
    internal let imageView = UIImageView(frame: CGRect.zero)
    
    private var _duration: CGFloat = 0.5
    private var _thumbCornerRadius: CGFloat = 0.5 {
        didSet {
            layoutSubviews()
        }
    }
    private var _cornerRadius: CGFloat = 0.5 {
        didSet {
            layoutSubviews()
        }
    }
    private var onPoint = CGPoint.zero
    private var offPoint = CGPoint.zero
    private var isAnimating = false
    
    /// MARK: - Life Cicle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        reset()
    }
    
    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        animate()
        
        return true
    }
    
    // MARK: Internal
    
    internal func animate() {
        playSwitchAnimation()
    }
    
    internal func setupThumbImage() {
        if let image = thumbImage {
            thumb.imageView.image = image
            thumb.imageView.contentMode = .scaleAspectFit
            thumb.imageView.clipsToBounds = true
            if isThumbImageColorAnimate {
                self.thumb.imageView.image = self.thumb.imageView.image?.withRenderingMode(.alwaysTemplate)
                self.thumb.imageView.tintColor = self._isOn ? self.offTintColor : self.onTintColor
            }
        }
    }
    
    internal func playSwitchAnimation() {
        _isOn = !_isOn
        isAnimating = true
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            self.backgroundColor = self._isOn ? self.onTintColor : self.offTintColor
			self.thumbBorderColor = self._isOn ? self.onTintColor : self.offTintColor
            self.thumb.frame.origin.x = self._isOn ? self.onPoint.x : self.offPoint.x
            if self.isThumbImageColorAnimate {
                self.thumb.imageView.tintColor = self._isOn ? self.offTintColor : self.onTintColor
            }
            self.additionalAnimation()            
        }, completion: { (isSuccess) in
            self.sendActions(for: UIControl.Event.valueChanged)
            self.isAnimating = false
        })
    }
    
    internal func additionalAnimation() {
        
    }
    
    internal func setup() {
        clear()
        addInnerShadow()
        setupThumbShadow()
        setupThumbImage()
        setupThumbBorder()
		
        addSubview(imageView)
        addSubview(thumb)
        
        thumb.backgroundColor = thumbTintColor
        backgroundColor = _isOn ? onTintColor : offTintColor
    }
    
    /// MARK: - Private
	
	private func setupThumbShadow() {
		thumb.layer.shadowColor = thumbShadowColor.cgColor
		thumb.layer.shadowRadius = thumbShadowRadius
		thumb.layer.shadowOpacity = thumbShadowOpacity
		thumb.layer.shadowOffset = thumbShadowOffset
	}
	
	private func setupThumbBorder() {
		thumb.layer.borderWidth = thumbBorderWidth
		thumb.layer.borderColor = _isOn ? onTintColor.cgColor : offTintColor.cgColor
	}
    
    private func reset() {
        guard isAnimating == false else {
            return
        }
        layer.cornerRadius = bounds.size.height * cornerRadius
        backgroundColor = _isOn ? onTintColor : offTintColor
		thumbBorderColor = _isOn ? onTintColor : offTintColor
        let aThumbSize = self.thumbSize != CGSize.zero ? self.thumbSize : CGSize(width: bounds.size.height - 2, height: bounds.height - 2)
        let yPos = (self.bounds.size.height - aThumbSize.height) / 2
        
        onPoint = CGPoint(x: bounds.size.width - aThumbSize.width - padding, y: yPos)
        offPoint = CGPoint(x: padding, y: yPos)
        
        thumb.frame = CGRect(origin: _isOn ? onPoint : offPoint, size: aThumbSize)
        thumb.layer.cornerRadius = aThumbSize.height * thumbCornerRadius
        
        imageView.frame = bounds
        imageView.layer.cornerRadius = bounds.size.height * cornerRadius
        imageView.clipsToBounds = true
    }
    
    private func clear() {
        subviews.forEach { $0.removeFromSuperview() }
        imageView.subviews.forEach { $0.removeFromSuperview() }
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        layer.removeAllAnimations()
    }
    
    private func addInnerShadow() {
        let innerShadow = CALayer()
        innerShadow.frame = bounds
        
        let radius:CGFloat = bounds.size.height * cornerRadius
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -innerShadowRadius, dy: -innerShadowRadius), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
        
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        innerShadow.shadowColor = innerShadowColor.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 0)
        innerShadow.shadowOpacity = innerShadowOpacity
        innerShadow.shadowRadius = innerShadowRadius
        innerShadow.cornerRadius = bounds.size.height * cornerRadius

        layer.addSublayer(innerShadow)
    }
}
