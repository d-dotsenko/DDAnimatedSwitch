//
//  SwitchCell.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import UIKit
import DDAnimatedSwitch


class SwitchCell: UITableViewCell {
    
    var bigSwitch: DDSwitch?
    var mediumSwitch: DDSwitch?
    var smallSwitch: DDSwitch?
    
    @IBOutlet weak var aShadow: UIView!
    @IBOutlet weak var aBackground: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var smallView: UIView!
    
    @IBOutlet weak var bSwitchHConstraint: NSLayoutConstraint!
    @IBOutlet weak var bSwitchWConstraint: NSLayoutConstraint!
    @IBOutlet weak var mSwitchHConstraint: NSLayoutConstraint!
    @IBOutlet weak var mSwitchWConstraint: NSLayoutConstraint!
    @IBOutlet weak var sSwitchHConstraint: NSLayoutConstraint!
    @IBOutlet weak var sSwitchWConstraint: NSLayoutConstraint!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        bigSwitch?.removeFromSuperview()
        mediumSwitch?.removeFromSuperview()
        smallSwitch?.removeFromSuperview()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        setup()
        reset()
    }
    
    public func updateWithModel(model: SwitchCellModel) {
        bigSwitch = model.bigSwitch
        mediumSwitch = model.mediumSwitch
        smallSwitch = model.smallSwitch
        
        bigView.addSubview(bigSwitch ?? model.bigSwitch)
        mediumView.addSubview(mediumSwitch ?? model.mediumSwitch)
        smallView.addSubview(smallSwitch ?? model.smallSwitch)
        
        titleLabel.text = model.titleStr
        
        reset()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        reset()
    }
    
    private func reset() {
        if let bigSwitch = bigSwitch {
            bSwitchWConstraint.constant = bigSwitch.bounds.size.width
            bSwitchHConstraint.constant = bigSwitch.bounds.size.height
        }
        if let mediumSwitch = mediumSwitch {
            mSwitchWConstraint.constant = mediumSwitch.bounds.size.width
            mSwitchHConstraint.constant = mediumSwitch.bounds.size.height
        }
        if let smallSwitch = smallSwitch {
            sSwitchWConstraint.constant = smallSwitch.bounds.size.width
            sSwitchHConstraint.constant = smallSwitch.bounds.size.height
        }
    }
    
    private func setup() {
        aBackground.layer.cornerRadius = 8
        aBackground.layer.masksToBounds = true
        
        aShadow.layer.cornerRadius = 8
        aShadow.layer.shadowColor = UIColor.black.cgColor
        aShadow.layer.shadowOffset = CGSize(width: 0, height: -2)
        aShadow.layer.shadowRadius = 5
        aShadow.layer.shadowOpacity = 0.5
        aShadow.layer.shouldRasterize = true
        aShadow.layer.rasterizationScale = UIScreen.main.scale
    }
}

extension UITableViewCell {
    static var reuseIdent: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
