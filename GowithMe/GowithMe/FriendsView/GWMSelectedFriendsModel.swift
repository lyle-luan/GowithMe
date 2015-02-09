//
//  GWMSelectedFriendsModel.swift
//  GowithMe
//
//  Created by Aaron on 2/5/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import Foundation

class GWMSelectedFriendsModel
{
    private var selectedFriendsList: [GWMFriend]?
    
    init()
    {
    }
    
    func addFriend(selectedFriend: GWMFriend)
    {
        if let hasSelectedFriendsList = selectedFriendsList
        {
            selectedFriendsList?.append(selectedFriend)
        }
        else
        {
            selectedFriendsList = [selectedFriend]
        }
    }
    
    func allSelectedFriends() -> [GWMFriend]?
    {
        return selectedFriendsList
    }
}
