//
//  ChartsViewController.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 01/11/21.
//

import UIKit

class ChartsViewController: UIViewController {
    //MARK: - UIElements
    @IBOutlet weak var chartsTable: UITableView!
    
    //MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfiguration()
    }
    
    //MARK: - Configuration Management
    private func initialConfiguration() {
        let cellId = String(describing: PieChartTableViewCell.self)
        self.chartsTable.register(UINib(nibName: "PieChartTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellId)
        self.chartsTable.dataSource = self
        self.chartsTable.delegate = self
    }
}

//MARK: - UITableViewDataSource Management
extension ChartsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: PieChartTableViewCell.self), for: indexPath) as! PieChartTableViewCell
    }
}

//MARK: - UITableViewDelegate Management
extension ChartsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
