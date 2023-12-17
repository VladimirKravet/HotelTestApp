//
//  NewTourist.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 17.12.2023.
//

import SwiftUI

class Tourist: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String = ""
    var surName: String = ""
    var citizenship: String = ""
    var passportNumber: String = ""
    var expiredDateOfPassport: String = ""
    
    init(
        id: String,
        name: String,
        surName: String,
        citizenship: String,
        passportNumber: String,
        expiredDateOfPassport: String
    ) {
        self.id = id
        self.name = name
        self.surName = surName
        self.citizenship = citizenship
        self.passportNumber = passportNumber
        self.expiredDateOfPassport = expiredDateOfPassport
    }
}
