//
//  String+Ext.swift
//  Hipo
//
//  Created by Ahmet Acar on 27.03.2021.
//

import Foundation


extension String {
    //count number of the occurrences
    func countNumberOfOccurrences(character: Character) -> Int {
        return self.filter { $0 == character }.count
    }
}
