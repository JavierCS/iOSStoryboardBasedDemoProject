//
//  TableViewManagementViewController.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 29/09/21.
//

import UIKit

class TableViewManagementViewController: UIViewController {
    //MARK: - UIElements
    @IBOutlet weak var personsTableView: UITableView!
    
    //MARK: - Logic Vars
    private var dataSource: [PersonGroupModel] = []
    
    //MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfiguration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchPersons()
    }
    
    //MARK: - Configuration Management
    private func initialConfiguration() {
        self.personsTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonTableViewCellId")
        self.personsTableView.dataSource = self
        self.personsTableView.delegate = self
    }
    
    //MARK: - Data Management
    private func fetchPersons() {
        guard let url = URL(string: "https://www.dropbox.com/s/bckyy4ilb2kuuxo/MyFavoritePersons.json?dl=1") else { return }
        self.showLoader()
        URLSession.shared.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            guard let self = self else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let persons = try JSONDecoder().decode([PersonGroupModel].self, from: data)
                DispatchQueue.main.async {
                    self.hideLoader {
                        self.showPersons(persons)
                    }
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func showPersons(_ persons: [PersonGroupModel]) {
        self.dataSource = persons
        self.personsTableView.reloadData()
    }
    
    private func saveImageAndUpdateCell(indexPath: IndexPath, image: UIImage) {
        self.dataSource[indexPath.section].persons[indexPath.row].image = image
        self.personsTableView.beginUpdates()
        self.personsTableView.reloadRows(at: [indexPath], with: .automatic)
        self.personsTableView.endUpdates()
    }
}

//MARK: - UITableViewDataSource Management
extension TableViewManagementViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCellId", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        cell.setPersonData(self.dataSource[indexPath.section].persons[indexPath.row])
        if let strUrl = dataSource[indexPath.section].persons[indexPath.row].photoUrl,
           let url = URL(string: strUrl),
           dataSource[indexPath.section].persons[indexPath.row].image == nil {
            DispatchQueue.global(qos: .utility).async {
                URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                    guard let self = self,
                          let data = data,
                          let image = UIImage(data: data) else  { return }
                    DispatchQueue.main.async {
                        self.saveImageAndUpdateCell(indexPath: indexPath, image: image)
                    }
                }.resume()
            }
        }
        return cell
    }
}

//MARK: - UITableViewDelegate Management
extension TableViewManagementViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}
