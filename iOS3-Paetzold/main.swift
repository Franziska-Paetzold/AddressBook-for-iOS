//
//  main.swift
//  iOS3-Paetzold
//
//  Created by Franziska Pätzold on 26.11.17.
//  Copyright © 2017 Franziska Pätzold. All rights reserved.
//

import Foundation

//funtions needed during running the code
func printACard(card: AddressCard){
    print("------------------------------------")
    var propertiesOfAddressCard: [Any]
    propertiesOfAddressCard = [card.fname, card.lname, card.address, card.postcode, card.place]
    for property in propertiesOfAddressCard{
        print("| \(property)")
    }
    print("| Hobbys: ")
    for hobby in card.hobbys{
        print("|  \(hobby)")
    }
    print("| Friends: ")
    for friend in card.friends{
        print("|  \(friend.fname!) \(friend.lname!)")
    }
    print("------------------------------------")
}

//json path for data
let json = "file:///Users/Franze/workspace/iOs/iOS3-Paetzold/iOS3-Paetzold/database.json"

// sample data
let card1 = AddressCard(fname: "Anja", lname: "Amsel", address: "Ahorn Allee 1", postcode: 15345, place: "Altbuchhorst", hobbys: ["Angeln", "Arbeiten"], friends: [AddressCard]())
let card2 = AddressCard(fname: "Peter", lname: "Parkett", address: "Poststraße 3", postcode: 02344, place: "Petersdorf", hobbys: ["Parken", "Picknicken"], friends: [card1])
let card3 = AddressCard(fname: "Bernd", lname: "Bauer", address: "Bahnhofsstraße 3", postcode: 12345, place: "Berlin", hobbys: ["Bastketball"], friends: [card1, card2])


var currAddressBook = AddressBook(listOfCards: [card1, card2, card3])

currAddressBook.sortByLastNames()

for currCard in currAddressBook.listOfCards{
    printACard(card: currCard)
}

let searchResult = currAddressBook.searchByLastName(searchWord: "Amsel ")
if let _searchResult = searchResult{
    printACard(card: _searchResult)
}

currAddressBook.save(toFile: json)
