//
//  HipoError.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 1.04.2021.
//

import Foundation

enum HipoError: String, Error {
    
    case urlError = "String value couldn't convert the string"
    case decodeError = "Github avatar couldn't decoded"
    case unexpectedError = "Unexpected error found please try again later"
}
