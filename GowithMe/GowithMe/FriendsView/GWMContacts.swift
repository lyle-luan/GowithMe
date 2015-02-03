//
//  GWMContactsManager.swift
//  GowithMe
//
//  Created by Aaron on 2/3/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import Foundation

class GWMContacts
{
    private var contacts = [GWMFriend]()
    
    init()
    {
        contacts.append(GWMFriend(name: "👄", telephone: ""))
        contacts.append(GWMFriend(name: "🈚️", telephone: "123"))
        contacts.append(GWMFriend(name: "🐶", telephone: "22"))
        contacts.append(GWMFriend(name: "🐱", telephone: "43434"))
    }
    
    func numOfCatalogue() -> Int
    {
        return 3
    }
    
    func numOfFriendsInCatalogue(catalogue: Int) -> Int
    {
        switch(catalogue)
        {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func nameOfCatalogue(catalogue: Int) -> String?
    {
        switch(catalogue)
        {
        case 0:
            return "Z"
        case 1:
            return "W"
        case 2:
            return "A"
        default:
            return ""
        }

    }
    
    func friendInCatalogue(catalogue: Int, number: Int) -> GWMFriend
    {
        switch(catalogue)
        {
        case 0:
            return contacts[0]
        case 1:
            return contacts[1]
        case 2:
            if number == 0
            {
                return contacts[2]
            }
            else
            {
                return contacts[3]
            }
        default:
            return contacts[4]
        }
    }
}