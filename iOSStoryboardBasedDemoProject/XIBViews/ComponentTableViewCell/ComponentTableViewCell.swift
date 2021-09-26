//
//  ComponentTableViewCell.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 25/09/21.
//

import UIKit

class ComponentTableViewCell: UITableViewCell {
    @IBOutlet weak var componentImageView: UIImageView!
    @IBOutlet weak var componentTitleLabel: UILabel!
    @IBOutlet weak var componentDescriptionLabel: UILabel!
    
    var component: ComponentModel?
    
    func setComponent(_ component: ComponentModel) {
        self.component = component
        self.componentImageView.image = component.image
        self.componentTitleLabel.text = component.name
        self.componentDescriptionLabel.text = component.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
