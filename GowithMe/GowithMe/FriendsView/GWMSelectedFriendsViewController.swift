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
        func removeOriginalSelectedFriends()
        {
            for originalSelectedFriend in view.subviews
            {
                if originalSelectedFriend is GWMFriendIcon
                {
                    originalSelectedFriend.removeFromSuperview()
                }
            }
        }
        
        if let selectedFriends = selectedFriends
        {
            if selectedFriends.count <= 0
            {
                removeOriginalSelectedFriends()
            }
            else
            {
                removeOriginalSelectedFriends()
                for index in 0...selectedFriends.count-1
                {
                    let friendIcon = GWMFriendIcon(friendInfo: selectedFriends[index] as GWMFriend, index:index)
                    var originalFrame = friendIcon.frame
                    originalFrame.origin.x = CGFloat(index*100)
                    friendIcon.frame = originalFrame
                    view.addSubview(friendIcon)
                    
                    friendIcon.addTarget(self, action: "cancelSelectedFriend:", forControlEvents: .TouchUpInside)
                }
            }
        }
    }
    
    func cancelSelectedFriend(touchedButton: GWMFriendIcon)
    {
        selectedFriends.removeSelectedFriend(atIndex: touchedButton.tag)
    }
    
    deinit
    {
        selectedFriends.removeObserver(self, forKeyPath: KVOSelectedFriendsList)
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
            if let valueChangeKind = change[NSKeyValueChangeKindKey] as? UInt
            {
                if let changeKind = NSKeyValueChange(rawValue: valueChangeKind)
                {
                    switch(changeKind)
                    {
                    case .Setting:
                        println("KVO Setting")
                        let newSelectedFriends = change[NSKeyValueChangeNewKey] as [GWMFriend]?
                        updateView(newSelectedFriends)
                        break;
                    case .Insertion:
                        println("KVO Insertion")
                        break;
                    case .Removal:
                        println("KVO Removal")
                        break;
                    case .Replacement:
                        println("KVO Replacement")
                        break;
                    }
                }
            }
        }
    }
}