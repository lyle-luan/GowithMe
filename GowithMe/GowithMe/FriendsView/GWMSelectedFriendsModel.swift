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
            selectedFriendsList?.append(selectedFriend)
//            mutableArrayValueForKey("selectedFriendsList").addObject(selectedFriend)
        }
        else
        {
            selectedFriendsList = [selectedFriend]
//            setValue([selectedFriend], forKey: "selectedFriendsList")
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