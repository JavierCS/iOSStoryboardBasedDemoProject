//
//  PersonTypeModel.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 29/09/21.
//

import Foundation

class PersonGroupModel: Codable {
    var typeName: String
    var persons: [PersonModel]
    
    enum CodingKeys: String, CodingKey {
        case typeName = "typeName"
        case persons = "persons"
    }
}
