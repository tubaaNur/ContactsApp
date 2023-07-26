//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 26.07.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var contactType: UILabel!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var DetailCollectionView: UICollectionView!
    
    var imageName = ""
    var labelName = ""
    var cT: ContactType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactImage.image = UIImage(named: imageName)
        contactName.text = labelName
        contactType.text = cT?.type
               
        DetailCollectionView.delegate = self
        DetailCollectionView.dataSource = self
        DetailCollectionView.isPagingEnabled = true
           }
       }

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Persons.persons.filter { $0.contactType == cT }.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactDetailsViewCell", for: indexPath) as! ContactDetailsViewCell
        
        let person = filterPersonsByContactType(indexPath.section, selectedContactType: cT)[indexPath.row]
        cell.cellLabel.text = person.name
        cell.cellImageView.image = UIImage(named:  person.gender.type)
        
        return cell
    }
    
    
}


