//
//  HipoModel.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 27.03.2021.
//

import Foundation

struct HipoModel: Codable {
    let company: String
    let team: String
    let members: [Members]
}

struct Members: Codable {
    let name: String
    let age: Int
    let location: String
    let github: String
    let hipo: HipoInfo
}

struct HipoInfo: Codable {
    let position: String
    let yearsInHipo: Int
}
