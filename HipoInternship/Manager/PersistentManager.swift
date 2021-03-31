//
//  PersistentManager.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 30.03.2021.
//

import Foundation 


class PersistenceManager {
    
    private let defaults = UserDefaults.standard
    static let members = "members"

    static func save(hipoMembers: [HipoModel]) {
        let data = hipoMembers.map { try? JSONEncoder().encode($0) }
        print("persistence manager data:\(data)")
        UserDefaults.standard.set(data, forKey: members)
    }

    static func load() -> [HipoModel] {
        guard let encodedData = UserDefaults.standard.array(forKey: members) as? [Data] else {
            return []
        }

        return encodedData.map { try! JSONDecoder().decode(HipoModel.self, from: $0) }
    }
//
//    public func saveJSON(j: JSON) {
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setValue(j.rawString()!, forKey: "json")
//        // here I save my JSON as a string
//    }
    
}

extension PersistenceManager {
    func saveJSONFile() {
        
    }

}
