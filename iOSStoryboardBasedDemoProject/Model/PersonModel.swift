//
//  PersonModel.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 29/09/21.
//

import Foundation
import UIKit.UIImage

class PersonModel: Codable {
    var name: String
    var shortDescription: String
    var longDescription: String
    var photoUrl: String?
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case shortDescription = "shortDescription"
        case longDescription = "longDescription"
        case photoUrl = "photoUrl"
    }
    
    func setImage(_ image: UIImage) {
        self.image = image
    }
}
