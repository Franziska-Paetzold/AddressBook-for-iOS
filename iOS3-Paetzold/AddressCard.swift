//
//  AddressCard.swift
//  iOS3-Paetzold
//
//  Created by Franziska Pätzold on 26.11.17.
//  Copyright © 2017 Franziska Pätzold. All rights reserved.
//

import Foundation

class AddressCard: Codable, Equatable{
    static func ==(firstCard: AddressCard, secondCard: AddressCard) -> Bool {
        return
            firstCard.fname == secondCard.fname &&
            firstCard.lname == secondCard.lname
    }
    
    var fname : String!
    var lname : String!
    var address : String!
    var postcode : Int!
    var place : String!
    var hobbys : [String]!
    var friends : [AddressCard]!
    
    init(fname: String, lname: String, address: String, postcode: Int, place: String, hobbys: [String], friends: [AddressCard]){
        self.fname = fname
        self.lname = lname
        self.address = address
        self.postcode = postcode
        self.place = place
        self.hobbys = hobbys
        self.friends = friends
    }
    
    func add(hobby: String){
        hobbys.append(hobby)
    }
    
    func remove(hobby: String){
        if let i = hobbys.index(of: hobby){
            hobbys.remove(at: i)
        }
    }
    
    
    //strong reference cycles 
    func add(friend: AddressCard){
        friends.append(friend)
        //auch bei dem anderen adden
        //möglcherweise bidirectionär 
    }
    
    func remove(friend: AddressCard){
        if let i = friends.index(of: friend){
            friends.remove(at: i)
            // auch bei dem anderen entfernen
        }
        
    }
}
