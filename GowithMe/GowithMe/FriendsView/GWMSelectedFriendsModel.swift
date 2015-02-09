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
        func isContainedFriend(friend: GWMFriend, friendsList: [GWMFriend]) -> Bool
        {
            //TODO: base on id, not name
            for indexFriend in friendsList
            {
                if indexFriend.name == friend.name
                {
                    return true
                }
            }
            return false
        }
        
        if let hasSelectedFriendsList = selectedFriendsList
        {
            if !isContainedFriend(selectedFriend, hasSelectedFriendsList)
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