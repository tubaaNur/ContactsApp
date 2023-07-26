//
//  ViewController.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contactsTableView: UITableView!

    private var selectedContactType: ContactType? {
        didSet {
            contactsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), style: .done, target: self, action: #selector(filterButtonAct))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc private func filterButtonAct() {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(identifier: "PickerViewController") as? PickerViewController {
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }
    
}

//MARK: - PickerViewController Delegate Methods
extension ViewController: PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType) {
        selectedContactType = type
    }
}


//MARK: - TableView Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return setSections().count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return setSections()[section].type
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterPersons(section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell
        
        cell.cellImageView.image = UIImage(named: filterPersons(indexPath.section)[indexPath.row].gender.type.lowercased())
        cell.cellTitleLabel.text = filterPersons(indexPath.section)[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func setSections() -> [ContactType] {
        
        if let selectedContactType {
            return [selectedContactType]
        } else {
            return ContactType.allCases
        }
    }
    
    private func filterPersons(_ sectionIndex: Int) -> [Person] {
        if selectedContactType == nil {
            return Persons.persons.filter({ $0.contactType == ContactType.allCases[sectionIndex] })
        } else {
            return Persons.persons.filter({ $0.contactType == selectedContactType })
        }
    }
    
}


