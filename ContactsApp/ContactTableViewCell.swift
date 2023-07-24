//
//  ContactTableViewCell.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 25.07.2023.
//

import UIKit
class ContactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
