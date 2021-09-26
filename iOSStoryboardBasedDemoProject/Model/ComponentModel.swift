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
    
    init(image: UIImage?, name: String, description: String) {
        self.image = image
        self.name = name
        self.description = description
    }
}
