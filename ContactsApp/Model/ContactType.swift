//
//  ContactType.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 26.07.2023.
//

enum ContactType: CaseIterable {
    case family
    case friend
    case work
    
    var type:String{
        switch self {
        case .family:
            return "Family"
        case .friend:
            return "Friend"
        case .work:
            return "Work"
        }
    }
}
