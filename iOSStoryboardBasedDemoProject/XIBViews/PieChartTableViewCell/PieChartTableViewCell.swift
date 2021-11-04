//
//  PieChartTableViewCell.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 01/11/21.
//

import UIKit
import Charts

class PieChartTableViewCell: UITableViewCell {
    //MARK: - UIElements
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let carEntry = PieChartDataEntry(value: 1200, label: "Auto", icon: NSUIImage(named: "car")?.withTintColor(.white))
        let cinemaEntry = PieChartDataEntry(value: 750, label: "Entretenimiento", icon: NSUIImage(named: "cinema")?.withTintColor(.white))
        let homeEntry = PieChartDataEntry(value: 2500, label: "Hogar", icon: NSUIImage(named: "home")?.withTintColor(.white))
        
        let entries = [
            carEntry,
            cinemaEntry,
            homeEntry
        ]
        
        let dataSet = PieChartDataSet(entries: entries, label: "Data Set Label")
        dataSet.drawValuesEnabled = false
        dataSet.colors = [UIColor.blue, UIColor.red, UIColor.orange]
        let data = PieChartData(dataSet: dataSet)
        
        self.pieChartView.centerText = "Has gastado \n$4000.00"
        self.pieChartView.drawEntryLabelsEnabled = false
        self.pieChartView.data = data
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
