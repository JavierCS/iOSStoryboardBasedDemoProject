//
//  InterfaceController.swift
//  SBBDPWatchApp WatchKit Extension
//
//  Created by jcruzsa on 12/10/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    //MARK: - UIElements
    @IBOutlet weak var profileGroup: WKInterfaceGroup!
    @IBOutlet weak var userImage: WKInterfaceImage!
    @IBOutlet weak var userNamelabel: WKInterfaceLabel!
    @IBOutlet weak var friendsNumberLabel: WKInterfaceLabel!
    @IBOutlet weak var coupleGroup: WKInterfaceGroup!
    @IBOutlet weak var coupleNameLabel: WKInterfaceLabel!
    @IBOutlet weak var petGroup: WKInterfaceGroup!
    @IBOutlet weak var petNameLabel: WKInterfaceLabel!
    @IBOutlet weak var peopleTable: WKInterfaceTable!
    
    var dataSource: [(name: String, description: String, sex: String)] = [
        ("Janai Santiago Lopez","Mi madre","M"),
        ("Arturo Escutia Lopez","Mi hermano de otra madre","H"),
        ("Miguel Ángel Medina Zarazua","Mi hermano de otra madre","H")
    ]
    
    //MARK: - Lifecycle Management
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        self.initialConfiguration()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    //MARK: - Configuration Management
    private func initialConfiguration() {
        peopleTable.setNumberOfRows(dataSource.count, withRowType: "PeopleCellId")
        
        for (index, person) in dataSource.enumerated() {
            guard let row = peopleTable.rowController(at: index) as? PeopleCellRowController else { continue }
            let imageName = person.sex == "H" ? "maleIcon" : "femaleIcon"
            row.personIconImage.setImageNamed(imageName)
            row.personNameLabel.setText(person.name)
            row.personShortDescriptionLabel.setText(person.description)
        }
    }
}
