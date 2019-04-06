//
//  ViewController.swift
//  DDAnimatedSwitchExample
//
//  Created by Dmitriy Dotsenko on 6/04/2019.
//  Copyright © 2019 DD. All rights reserved.
//

import UIKit
import DDAnimatedSwitch

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var switches = [SwitchCellModel]()
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: SwitchCell.reuseIdent, bundle: Bundle.main),
                           forCellReuseIdentifier: SwitchCell.reuseIdent)
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "swamp4")!)
        view.addLightBlur()
        
        tableView.separatorStyle = .none
        fillModels()
        tableView.reloadData()
    }
    
    func fillModels() {
        let bSwitchEarth = EarthSwitch(frame: CGRect(x: 0, y: 0, width: 160, height: 90))
        let mSwitchEarth = EarthSwitch2(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        let sSwitchEarth = EarthSwitch3(frame: CGRect(x: 0, y: 0, width: 50, height: 15))
        
        let bSwitchCircle = CircleSwitch(frame: CGRect(x: 0, y: 0, width: 180, height: 90))
        let mSwitchCircle = CircleSwitch2(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        let sSwitchCircle = CircleSwitch3(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        let bSwitchCity = CitySwitch(frame: CGRect(x: 0, y: 0, width: 180, height: 90))
        let mSwitchCity = CitySwitch2(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        let sSwitchCity = CitySwitch3(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        
        let bSwitchForest = ForestSwitch(frame: CGRect(x: 0, y: 0, width: 160, height: 85))
        let mSwitchForest = ForestSwitch2(frame: CGRect(x: 0, y: 0, width: 110, height: 60))
        let sSwitchForest = ForestSwitch3(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        
        let bSwitchVolume = VolumeSwitch(frame: CGRect(x: 0, y: 0, width: 120, height: 75))
        let mSwitchVolume = VolumeSwitch2(frame: CGRect(x: 0, y: 0, width: 100, height: 45))
        let sSwitchVolume = VolumeSwitch3(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        let bSwitchSmile = SmileSwitch(frame: CGRect(x: 0, y: 0, width: 120, height: 85))
        let mSwitchSmile = SmileSwitch2(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let sSwitchSmile = SmileSwitch3(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        let bSwitchTick = TickSwitch(frame: CGRect(x: 0, y: 0, width: 140, height: 80))
        let mSwitchTick = TickSwitch2(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        let sSwitchTick = TickSwitch3(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        let bSwitchYesNo = YesNoSwitch(frame: CGRect(x: 0, y: 0, width: 140, height: 80))
        let mSwitchYesNo = YesNoSwitch2(frame: CGRect(x: 0, y: 0, width: 120, height: 55))
        let sSwitchYesNo = YesNoSwitch3(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        
        let bSwitchBoy = BoySwitch(frame: CGRect(x: 0, y: 0, width: 160, height: 100))
        let mSwitchBoy = BoySwitch2(frame: CGRect(x: 0, y: 0, width: 120, height: 65))
        let sSwitchBoy = BoySwitch3(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        
        let bSwitchMoonSun = MoonSunSwitch(frame: CGRect(x: 0, y: 0, width: 180, height: 85))
        let mSwitchMoonSun = MoonSunSwitch2(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        let sSwitchMoonSun = MoonSunSwitch3(frame: CGRect(x: 0, y: 0, width: 50, height: 15))
        
        let bSwitchCrescentSun = CrescentSunSwitch(frame: CGRect(x: 0, y: 0, width: 140, height: 70))
        let mSwitchCrescentSun = CrescentSunSwitch2(frame: CGRect(x: 0, y: 0, width: 130, height: 60))
        let sSwitchCrescentSun = CrescentSunSwitch3(frame: CGRect(x: 0, y: 0, width: 75, height: 70))
        
        let bSwitchDayNight = DayNightSwitch(frame: CGRect(x: 0, y: 0, width: 160, height: 85))
        let mSwitchDayNight = DayNightSwitch2(frame: CGRect(x: 0, y: 0, width: 110, height: 70))
        let sSwitchDayNight = DayNightSwitch3(frame: CGRect(x: 0, y: 0, width: 80, height: 55))
        
        let bSwitchLabelOnOff = OnOffLabelSwitch(frame: CGRect(x: 0, y: 0, width: 160, height: 90))
        let mSwitchLabelOnOff = OnOffLabelSwitch2(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        let sSwitchLabelOnOff = OnOffLabelSwitch3(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        let bSwitchImageUpDown = UpDownImageSwitch(frame: CGRect(x: 0, y: 0, width: 180, height: 70))
        let mSwitchImageUpDown = UpDownImageSwitch2(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let sSwitchImageUpDown = UpDownImageSwitch3(frame: CGRect(x: 0, y: 0, width: 100, height: 35))

        let aEarthModel = SwitchCellModel(bigSwitch: bSwitchEarth, mediumSwitch: mSwitchEarth, smallSwitch: sSwitchEarth)
        aEarthModel.titleStr = "EarthSwitch"
        let aCircleModel = SwitchCellModel(bigSwitch: bSwitchCircle, mediumSwitch: mSwitchCircle, smallSwitch: sSwitchCircle)
        aCircleModel.titleStr = "CircleSwitch"
        let aCityModel = SwitchCellModel(bigSwitch: bSwitchCity, mediumSwitch: mSwitchCity, smallSwitch: sSwitchCity)
        aCityModel.titleStr = "CitySwitch"
        let aForestModel = SwitchCellModel(bigSwitch: bSwitchForest, mediumSwitch: mSwitchForest, smallSwitch: sSwitchForest)
        aForestModel.titleStr = "ForestSwitch"
        let aVolumeModel = SwitchCellModel(bigSwitch: bSwitchVolume, mediumSwitch: mSwitchVolume, smallSwitch: sSwitchVolume)
        aVolumeModel.titleStr = "VolumeSwitch"
        let aSmileModel = SwitchCellModel(bigSwitch: bSwitchSmile, mediumSwitch: mSwitchSmile, smallSwitch: sSwitchSmile)
        aSmileModel.titleStr = "SmileSwitch"
        let aTickModel = SwitchCellModel(bigSwitch: bSwitchTick, mediumSwitch: mSwitchTick, smallSwitch: sSwitchTick)
        aTickModel.titleStr = "TickSwitch"
        let aYesNoModel = SwitchCellModel(bigSwitch: bSwitchYesNo, mediumSwitch: mSwitchYesNo, smallSwitch: sSwitchYesNo)
        aYesNoModel.titleStr = "YesNoSwitch"
        let aBoyModel = SwitchCellModel(bigSwitch: bSwitchBoy, mediumSwitch: mSwitchBoy, smallSwitch: sSwitchBoy)
        aBoyModel.titleStr = "BoySwitch"
        let aMoonSunModel = SwitchCellModel(bigSwitch: bSwitchMoonSun, mediumSwitch: mSwitchMoonSun, smallSwitch: sSwitchMoonSun)
        aMoonSunModel.titleStr = "MoonSunSwitch"
        let aCrescentSunModel = SwitchCellModel(bigSwitch: bSwitchCrescentSun, mediumSwitch: mSwitchCrescentSun, smallSwitch: sSwitchCrescentSun)
        aCrescentSunModel.titleStr = "CrescentSunSwitch"
        let aDayNightModel = SwitchCellModel(bigSwitch: bSwitchDayNight, mediumSwitch: mSwitchDayNight, smallSwitch: sSwitchDayNight)
        aDayNightModel.titleStr = "DayNightSwitch"
        let aOnOffLabelModel = SwitchCellModel(bigSwitch: bSwitchLabelOnOff, mediumSwitch: mSwitchLabelOnOff, smallSwitch: sSwitchLabelOnOff)
        aOnOffLabelModel.titleStr = "OnOffLabelSwitch"
        let aUpDownImageModel = SwitchCellModel(bigSwitch: bSwitchImageUpDown, mediumSwitch: mSwitchImageUpDown, smallSwitch: sSwitchImageUpDown)
        aUpDownImageModel.titleStr = "UpDownImageSwitch"
        
        switches = [aEarthModel, aCircleModel, aCityModel, aForestModel, aVolumeModel, aSmileModel, aTickModel, aYesNoModel, aBoyModel, aMoonSunModel, aCrescentSunModel, aDayNightModel, aOnOffLabelModel, aUpDownImageModel]
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let bSwitchH = switches[indexPath.row].bigSwitch.bounds.height
        let msSwitchH = switches[indexPath.row].mediumSwitch.bounds.height + switches[indexPath.row].smallSwitch.bounds.height + 20
        let switchH = max(bSwitchH, msSwitchH)
        return 10 + 30 + 10 + switchH + 20 + 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return switches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.reuseIdent, for: indexPath) as? SwitchCell {
            cell.updateWithModel(model: switches[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension UIView {
    func addLightBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
        sendSubviewToBack(blurEffectView)
    }
}
