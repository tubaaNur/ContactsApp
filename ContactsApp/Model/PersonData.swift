//
//  PersonData.swift
//  ContactsApp
//
//  Created by Tuba Nur  on 26.07.2023.
//

struct Persons {
    static let persons: [Person] = [
        Person(name: "Tuba",gender: .woman, contactType: .family),
        Person(name: "Başar",  gender: .man, contactType: .family),
        Person(name: "Kübra",  gender: .woman, contactType: .family),
        Person(name: "Sema",  gender: .woman, contactType: .friend),
        Person(name: "Özge", gender: .man, contactType: .family),
        Person(name: "Duygu",gender: .woman, contactType: .family),
        Person(name: "Mehmet", gender: .man, contactType: .friend),
        Person(name: "Ayşe", gender: .woman, contactType: .family),
        Person(name: "Kerem", gender: .man, contactType: .friend),
        Person(name: "David",gender: .woman, contactType: .family),
        Person(name: "Alice", gender: .man, contactType: .work),
        Person(name: "Nur", gender: .woman, contactType: .family),
        Person(name: "Yıldız", gender: .man, contactType: .work),
        Person(name: "John",gender: .woman, contactType: .friend),
        Person(name: "Doe", gender: .man, contactType: .friend),
        Person(name: "Harun", gender: .woman, contactType: .work),
        Person(name: "Adnan", gender: .man, contactType: .work),
        Person(name: "Sena", gender: .woman, contactType: .work),
        Person(name: "Burak", gender: .man, contactType: .work),
    ]
}

func filterPersonsByContactType(_ sectionIndex: Int, selectedContactType: ContactType?) -> [Person] {
    if selectedContactType == nil {
        return Persons.persons.filter({ $0.contactType == ContactType.allCases[sectionIndex] })
    } else {
        return Persons.persons.filter({ $0.contactType == selectedContactType })
    }
}
