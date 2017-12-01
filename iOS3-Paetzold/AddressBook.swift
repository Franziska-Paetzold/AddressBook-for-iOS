//
//  AddressBook.swift
//  iOS3-Paetzold
//
//  Created by Franziska Pätzold on 26.11.17.
//  Copyright © 2017 Franziska Pätzold. All rights reserved.
//

import Foundation

class AddressBook: Codable{
    var listOfCards: [AddressCard]
   
    init(listOfCards: [AddressCard]){
        self.listOfCards = listOfCards
    }
    
    func add(card: AddressCard){
        listOfCards.append(card)
    }
    
    func remove(card: AddressCard){
        if let i = listOfCards.index(of: card){
            listOfCards.remove(at: i)
        }
        
        for person in listOfCards{
            if let friendIndex = person.friends.index(of: card){
                person.friends.remove(at: friendIndex)
            }
        }
    }
    
    func sortCards(card1: AddressCard, card2: AddressCard) -> Bool{
        return card1.lname < card2.lname
    }
    
    func sortByLastNames(){
        listOfCards.sort(by: sortCards)
    }
  
    func searchByLastName(searchWord: String) -> AddressCard?{
        let trimmedSearchword = searchWord.trimmingCharacters(in: .whitespaces)
        for card in listOfCards{
              if card.lname.contains(trimmedSearchword) == true{
                return card
            }
        }
        return nil
    }
    
    /*
    func save(toFile path: String){
        let jsonEncoder = JSONEncoder()
        if let addressBookData = try? jsonEncoder.encode(listOfCards){
            try? addressBookData.write(to: URL.init(string: path)! )
        }
    }
    */
    
    func save(toFile path: String){
        let jsonEncoder = JSONEncoder()
        let jsonListOfCrads = try! jsonEncoder.encode(listOfCards)
       // print(String(data: jsonListOfCrads, encoding: .utf8)!)
        try! jsonListOfCrads.write(to: URL.init(string: path)! )
    }
    
    class func readAddressBook(fromFile path: String) -> AddressBook?{
        let jsonDecoder = JSONDecoder()
        if let addressBookData = try? jsonDecoder.decode(AddressCard.self, from: Data(contentsOf: URL.init(string: path)!))
        //if let addressBookData = try? jsonDecoder.decode(AddressBook.self, from: URL.init(string: path))
        //if let addressBookData = try? jsonDecoder.decode(AddressBook.self, from: path/addressBook.json)
        //{listOfCards.append(addressBookData)}
        {let newAddressBook = AddressBook(listOfCards: [addressBookData])
            return newAddressBook}
        else{
            return nil}
    }
    
    
}
