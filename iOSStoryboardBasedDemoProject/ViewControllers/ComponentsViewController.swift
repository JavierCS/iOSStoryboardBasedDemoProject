//
//  ComponentsViewController.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 25/09/21.
//

import UIKit

class ComponentsViewController: UIViewController {
    //MARK: - UIElements
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: [ComponentSectionModel] = [
        ComponentSectionModel(title: "UIKit", components: [
            ComponentModel(image: nil, name: "Form", description: """
            This section uses common UI elements,
            UILabel
            UITextField
            UITextView
            UIButton
            UISwitch
            UIStepper
            UISlider
            UIPicker
            UIScrollView
            """, segueName: "menuToForm"),
            ComponentModel(image: nil, name: "UITableView", description: "", segueName: "menuToTable"),
            ComponentModel(image: nil, name: "UICollectionView", description: "", segueName: "menuToCollection"),
            ComponentModel(image: nil, name: "UIPageControl", description: ""),
            ComponentModel(image: nil, name: "MapkitView", description: ""),
            ComponentModel(image: nil, name: "Charts", description: "", segueName: "menuToCharts")
        ]),
        ComponentSectionModel(title: "Animations", components: [
            ComponentModel(image: nil, name: "UIView.Animate", description: ""),
            ComponentModel(image: nil, name: "KeyFrame Animations", description: "")
        ]),
        ComponentSectionModel(title: "Networking", components: [
            ComponentModel(image: nil, name: "URLSession", description: ""),
            ComponentModel(image: nil, name: "Alamofire", description: "")
        ]),
        ComponentSectionModel(title: "Persistance", components: [
            ComponentModel(image: nil, name: "Key Chain", description: ""),
            ComponentModel(image: nil, name: "Core Data", description: "")
        ]),
        ComponentSectionModel(title: "Firebase", components: [
            ComponentModel(image: nil, name: "Remote Config", description: ""),
            ComponentModel(image: nil, name: "Dynamic Link", description: ""),
            ComponentModel(image: nil, name: "Push Notification", description: "")
        ])
    ]
    
    //MARK: - LifeCycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfiguration()
    }
    
    //MARK: - Configuration Management
    func initialConfiguration() {
        self.tableView.register(UINib(nibName: "ComponentTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ComponentTableViewCellId")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

//MARK: -
extension ComponentsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComponentTableViewCellId", for: indexPath) as! ComponentTableViewCell
        cell.setComponent(dataSource[indexPath.section].components[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].components.count
    }
}

//MARK: -
extension ComponentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let segueIdentifier = dataSource[indexPath.section].components[indexPath.row].segueName else { return }
        self.performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}
