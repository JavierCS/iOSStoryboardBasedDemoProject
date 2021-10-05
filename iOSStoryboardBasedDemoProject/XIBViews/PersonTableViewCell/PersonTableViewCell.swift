//
//  PersonTableViewCell.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 04/10/21.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var personPictureImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personDescriptionLabel: UILabel!
    
    var person: PersonModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.personPictureImageView.layer.cornerRadius = 10
        self.personPictureImageView.layer.shadowColor = UIColor.black.cgColor
        self.personPictureImageView.layer.shadowOffset = .zero
        self.personPictureImageView.layer.shadowOpacity = 0.5
        self.personPictureImageView.layer.shadowRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPersonData(_ person: PersonModel) {
        self.personPictureImageView.image = person.image ?? UIImage(named: "userPlaceholder")
        self.personNameLabel.text = person.name
        self.personDescriptionLabel.text = person.shortDescription
        self.person = person
    }
}
