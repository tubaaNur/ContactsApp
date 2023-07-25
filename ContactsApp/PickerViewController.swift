//
//  PickerViewController.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 25.07.2023.
//

import UIKit

protocol PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType)
}

extension PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType) {}
}

class PickerViewController: UIViewController {
    
    @IBOutlet weak var filterPickerView: UIPickerView!
    
    
    private var selectedContactType: ContactType?
    
    var delegate: PickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
    }
    
    @IBAction func doneButtonAct(_ sender: UIButton) {
        delegate?.didSelectContactType(selectedContactType ?? .friend)
        dismiss(animated: true)
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ContactType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ContactType.allCases[row].type
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedContactType = ContactType.allCases[row]
    }
}

