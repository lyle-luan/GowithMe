//
//  GWMSelectedFriendsModel.swift
//  GowithMe
//
//  Created by Aaron on 2/5/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import Foundation

class GWMSelectedFriendsModel: NSObject
{
    dynamic private var selectedFriendsList: [GWMFriend]?
    
    func addFriend(selectedFriend: GWMFriend)
    {
        if let hasSelectedFriendsList = selectedFriendsList
        {
            if !isContainedFriend(selectedFriend)
            {
                selectedFriendsList?.append(selectedFriend)
            }
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
    
    func removeSelectedFriend(atIndex index :Int)
    {
        selectedFriendsList?.removeAtIndex(index)
    }
    
    func removeSelectedFriend(removeFriend :GWMFriend)
    {
        //TODO: base on id, not name, maybe should base on address
        if let hasSelectedFriendsList = selectedFriendsList
        {
            if hasSelectedFriendsList.count > 0
            {
                for index in 0...hasSelectedFriendsList.count-1
                {
                    if hasSelectedFriendsList[index].name == removeFriend.name
                    {
                        selectedFriendsList?.removeAtIndex(index)
                        return
                    }
                }
            }
        }
    }
    
    func isContainedFriend(friend: GWMFriend) -> Bool
    {
        //TODO: base on id, not name, maybe should base on address
        if let hasSelectedFriendsList = selectedFriendsList
        {
            for indexFriend in hasSelectedFriendsList
            {
                if indexFriend.name == friend.name
                {
                    return true
                }
            }
        }
        return false
    }
}

extension GWMSelectedFriendsModel
{
//    override func valueForKey(key: String) -> AnyObject?
//    {
//        return selectedFriendsList
//    }
//    
//    override func valueForUndefinedKey(key: String) -> AnyObject?
//    {
//        println("undefined key: \(key)")
//        return selectedFriendsList
//    }
    
//    func countOfSelectedFriendsList() -> Int
//    {
//        if let count = selectedFriendsList?.count
//        {
//            return count
//        }
//        else
//        {
//            return 0
//        }
//    }
//    
//    func objectInSelectedFriendsListAtIndex(index: Int) -> GWMFriend?
//    {
//        return selectedFriendsList?[index]
//    }
//    
//    func insertObject(anFriend: GWMFriend, inSelectedFriendsListAtIndex index: Int)
//    {
//        selectedFriendsList?.insert(anFriend, atIndex: index)
//    }
//    
//    func removeObjectFromSelectedFriendsListAtIndex(index :Int)
//    {
//        selectedFriendsList?.removeAtIndex(index)
//    }
}