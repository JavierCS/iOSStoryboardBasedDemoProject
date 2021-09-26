//
//  ComponentSectionModel.swift
//  iOSStoryboardBasedDemoProject
//
//  Created by jcruzsa on 25/09/21.
//

struct ComponentSectionModel {
    var title: String
    var components: [ComponentModel]
    
    init(title: String, components: [ComponentModel]) {
        self.title = title
        self.components = components
    }
}
