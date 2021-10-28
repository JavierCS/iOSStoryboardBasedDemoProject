//
//  UIComponentsInterfaceController.swift
//  SBBDPWatchApp WatchKit Extension
//
//  Created by jcruzsa on 14/10/21.
//

import WatchKit

class UIComponentsInterfaceController: WKInterfaceController {
    //MARK: - UIComponents
    @IBOutlet weak var switchValueLabel: WKInterfaceLabel!
    @IBOutlet weak var switchComponent: WKInterfaceSwitch!
    @IBOutlet weak var sliderValueLabel: WKInterfaceLabel!
    @IBOutlet weak var sliderComponent: WKInterfaceSlider!
    @IBOutlet weak var pickerValueLabel: WKInterfaceLabel!
    
    var pickerItems: [WKPickerItem] = {
        let optionZero = WKPickerItem()
        optionZero.title = "Option 0"
        let optionOne = WKPickerItem()
        optionOne.title = "Option 1"
        let optionTwo = WKPickerItem()
        optionTwo.title = "Option 2"
        return [
            optionZero,
            optionOne,
            optionTwo
        ]
    }()
    
    //MARK: - Lifecycle Management
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if segueIdentifier == "PickerSegueId" {
            return pickerItems
        }
        return nil
    }
    
    //MARK: - IBActions Management
    @IBAction func didChangeSwitchValue(_ value: Bool) {
        self.switchValueLabel.setText("Value: \(value)")
    }
    
    @IBAction func didChangeSliderValue(_ value: Float) {
        self.sliderValueLabel.setText("Value: \(value)")
    }
}
