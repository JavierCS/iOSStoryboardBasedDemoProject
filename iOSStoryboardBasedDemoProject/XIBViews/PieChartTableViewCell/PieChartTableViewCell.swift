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
        let entries = [
            PieChartDataEntry(value: 40, label: "TDC"),
            PieChartDataEntry(value: 50, label: "TDD")
        ]
        
        let dataSet = PieChartDataSet(entries: entries, label: "Data Set Label")
        dataSet.colors = [UIColor.blue, UIColor.green]
        let data = PieChartData(dataSet: dataSet)
        
        self.pieChartView.data = data
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
