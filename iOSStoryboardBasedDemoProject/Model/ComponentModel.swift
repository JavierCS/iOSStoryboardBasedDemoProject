//
//  ComponentModel.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 25/09/21.
//

import UIKit

struct ComponentModel {
    var image: UIImage?
    var name: String
    var description: String
    var segueName: String?
    
    init(image: UIImage?, name: String, description: String, segueName: String? = nil) {
        self.image = image
        self.name = name
        self.description = description
        self.segueName = segueName
    }
}
