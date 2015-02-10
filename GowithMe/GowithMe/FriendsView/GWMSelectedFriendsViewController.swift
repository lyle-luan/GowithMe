//
//  GWMSelectedFriendsViewController.swift
//  GowithMe
//
//  Created by Aaron on 2/5/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

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
    
    func updateView(selectedFriends:[GWMFriendModel]?)
    {
        func removeOriginalSelectedFriends()
        {
            for originalSelectedFriend in view.subviews
            {
                if originalSelectedFriend is GWMFriendIconView
                {
                    originalSelectedFriend.removeFromSuperview()
                }
            }
        }
        
        if let selectedFriends = selectedFriends
        {
            removeOriginalSelectedFriends()
            for index in 0..<selectedFriends.count
            {
                let friendIcon = GWMFriendIconView(friendInfo: selectedFriends[index] as GWMFriendModel, index:index)
                var originalFrame = friendIcon.frame
                originalFrame.origin.x = CGFloat(index*100)
                friendIcon.frame = originalFrame
                view.addSubview(friendIcon)
                
                friendIcon.addTarget(self, action: "cancelSelectedFriend:", forControlEvents: .TouchUpInside)
            }
        }
    }
    
    func cancelSelectedFriend(touchedButton: GWMFriendIconView)
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
                        println("KVO Setting - selectedFriendsVC")
                        let newSelectedFriends = change[NSKeyValueChangeNewKey] as [GWMFriendModel]?
                        updateView(newSelectedFriends)
                    case .Insertion:
                        println("KVO Insertion - selectedFriendsVC")
                    case .Removal:
                        println("KVO Removal - selectedFriendsVC")
                    case .Replacement:
                        println("KVO Replacement - selectedFriendsVC")
                    }
                }
            }
        }
    }
}