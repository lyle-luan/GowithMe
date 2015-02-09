//
//  GWMSelectedFriendsViewController.swift
//  GowithMe
//
//  Created by Aaron on 2/5/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

private let KVOSelectedFriendsList = "selectedFriendsList"

class GWMSelectedFriendsViewController: UIViewController
{
    var selectedFriends :GWMSelectedFriendsModel!
    {
        didSet
        {
            selectedFriends.addObserver(self, forKeyPath:KVOSelectedFriendsList, options:.New, context:nil)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
    }
    
    func updateView(selectedFriends:[GWMFriend]?)
    {
        if let selectedFriends = selectedFriends
        {
            for friend in selectedFriends
            {
                println("friend name: \(friend.name)")
            }
        }
    }
}

extension GWMSelectedFriendsViewController
{
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>)
    {
        if object as? GWMSelectedFriendsModel !== selectedFriends
        {
            return
        }
        else if keyPath == KVOSelectedFriendsList
        {
            let testX = NSKeyValueChange.Insertion.rawValue
            
            if let valueChangeKind = change[NSKeyValueChangeKindKey] as? UInt
            {
                if let changeKind = NSKeyValueChange(rawValue: valueChangeKind)
                {
                    switch(changeKind)
                    {
                    case .Setting:
                        println("Setting")
                        let newSelectedFriends = change[NSKeyValueChangeNewKey] as [GWMFriend]?
                        updateView(newSelectedFriends)
                        break;
                    case .Insertion:
                        println("Insertion")
                        break;
                    case .Removal:
                        println("Removal")
                        break;
                    case .Replacement:
                        println("Replacement")
                        break;
                    }
                }
            }
        }
    }
}