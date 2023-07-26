//
//  PersonData.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 26.07.2023.
//

struct Persons {
    static let persons: [Person] = [
        Person(name: "Pilav",gender: .man, contactType: .friend),
        Person(name: "Limonata",  gender: .woman, contactType: .family),
        Person(name: "Musakka",  gender: .man, contactType: .family),
        Person(name: "Tavuk Sote",  gender: .woman, contactType: .family),
        Person(name: "Pizza", gender: .man, contactType: .family),
        Person(name: "Hamburger",gender: .woman, contactType: .family),
        Person(name: "Baklava", gender: .man, contactType: .family),
        Person(name: "Künefe", gender: .woman, contactType: .family),
        Person(name: "Latte", gender: .man, contactType: .family),
    ]
}

func filterPersonsByContactType(_ sectionIndex: Int, selectedContactType: ContactType?) -> [Person] {
    if selectedContactType == nil {
        return Persons.persons.filter({ $0.contactType == ContactType.allCases[sectionIndex] })
    } else {
        return Persons.persons.filter({ $0.contactType == selectedContactType })
    }
}
