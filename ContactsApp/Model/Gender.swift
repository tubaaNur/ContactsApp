//
//  Gender.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 26.07.2023.
//


enum Gender: CaseIterable {
    case man
    case woman
    
    var type:String{
        switch self {
        case .woman:
            return "woman"
        case .man:
            return "man"
        }
    }
}
