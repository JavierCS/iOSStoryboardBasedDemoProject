//
//  PickerInterfaceController.swift
//  SBBDPWatchApp WatchKit Extension
//
//  Created by jcruzsa on 14/10/21.
//

import WatchKit
import Foundation

class PickerInterfaceController: WKInterfaceController {
    //MARK: - UIElements
    @IBOutlet weak var pickerComponent: WKInterfacePicker!

    var pickerItems: [WKPickerItem] = []
    
    //MARK: - Lifecycle Management
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        guard let items = context as? [WKPickerItem] else { return }
        self.pickerItems = items
        self.initialConfiguration()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //MARK: - Configuration Management
    private func initialConfiguration() {
        self.pickerComponent.setItems(self.pickerItems)
    }
    
    //MARK: - UIElements
    @IBAction func didChangePickerValue(_ value: Int) {
        
    }
}
