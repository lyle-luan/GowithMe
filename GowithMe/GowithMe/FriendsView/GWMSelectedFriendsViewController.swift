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
//            selectedFriends.addObserver(self, forKeyPath:KVOSelectedFriendsList, options:.New, context:nil)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
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
            let newSelectedFriends = change[NSKeyValueChangeNewKey] as? GWMSelectedFriendsModel
            if let hasNewSelectedFriends = newSelectedFriends
            {
                println("\(hasNewSelectedFriends)")
            }
            println("no")
        }
    }
}