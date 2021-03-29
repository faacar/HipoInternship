//
//  HipoModel.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 27.03.2021.
//

import Foundation

struct HipoModel: Codable {
    let company: String
    var team: String
    var members: [Members]
}

struct Members: Codable {
    var name: String
    var age: Int
    var location: String
    var github: String
    var hipo: HipoInfo
}

struct HipoInfo: Codable {
    var position: String
    var yearsInHipo: Int
}
