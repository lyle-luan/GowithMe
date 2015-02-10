//
//  GWMSelectedFriendsModel.swift
//  GowithMe
//
//  Created by Aaron on 2/5/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import Foundation

let KVOSelectedFriendsList = "selectedFriendsList"

enum GWMSelecteFriendsResult
{
    case Success
    case Fail
    case Repeat
}

class GWMSelectedFriendsModel: NSObject
{
    dynamic private var selectedFriendsList = [GWMFriendModel]()
    
    func addFriend(selectedFriend: GWMFriendModel) -> GWMSelecteFriendsResult
    {
        if !isContainedFriend(selectedFriend)
        {
            selectedFriendsList.append(selectedFriend)
            return .Success
        }
        else
        {
            return .Repeat
        }
    }
    
    func allSelectedFriends() -> [GWMFriendModel]
    {
        return selectedFriendsList
    }
    
    func removeSelectedFriend(atIndex index :Int)
    {
        selectedFriendsList.removeAtIndex(index)
    }
    
    func removeSelectedFriend(removeFriend :GWMFriendModel)
    {
        //TODO: base on id, not name, maybe should base on address
        for index in 0..<selectedFriendsList.count
        {
            if selectedFriendsList[index].name == removeFriend.name
            {
                selectedFriendsList.removeAtIndex(index)
                return
            }
        }
    }
    
    private func isContainedFriend(friend: GWMFriendModel) -> Bool
    {
        //TODO: base on id, not name, maybe should base on address
        for indexFriend in selectedFriendsList
        {
            if indexFriend.name == friend.name
            {
                return true
            }
        }
        return false
    }
}