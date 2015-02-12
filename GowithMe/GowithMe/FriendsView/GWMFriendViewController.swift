//
//  GWMFriendViewController.swift
//  GowithMe
//
//  Created by Aaron on 2/3/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class GWMFriendViewController: UIViewController
{
    //TODO: I will do addFriend here
    
    private let contacts = GWMContactsModel()
    private let selectedFriendsViewController = GWMSelectedFriendsViewController()
    private let actionsViewController: GWMActionsViewController
    private let selectedFriends = GWMSelectedFriendsModel()
    
    override init()
    {
        actionsViewController = GWMActionsViewController.positionActions()
        super.init(nibName: nil, bundle: nil)
        selectedFriends.addObserver(self, forKeyPath: KVOSelectedFriendsList, options: .New, context: nil)
    }
    
    override func viewDidLoad()
    {
        var viewFrame = UIScreen.mainScreen().bounds
        
        var actionViewFrame = viewFrame
        actionViewFrame.size.height = 100
        actionViewFrame.origin.y = viewFrame.origin.y+viewFrame.size.height-actionViewFrame.size.height
        actionsViewController.view.frame = actionViewFrame
        actionsViewController.selectedFriends = selectedFriends
        view.addSubview(actionsViewController.view)
        
        var selectedFriendViewFrame = viewFrame
        selectedFriendViewFrame.size.height = 100
        selectedFriendViewFrame.origin.y = actionViewFrame.origin.y-selectedFriendViewFrame.size.height
        selectedFriendsViewController.view.frame = selectedFriendViewFrame
        selectedFriendsViewController.selectedFriends = selectedFriends
        view.addSubview(selectedFriendsViewController.view)
        
        var friendsTableView = UITableView()
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        var friendsTableViewFrame = viewFrame
        friendsTableViewFrame.size.height = viewFrame.size.height-actionViewFrame.size.height-selectedFriendViewFrame.size.height
        friendsTableView.frame = friendsTableViewFrame
        view.addSubview(friendsTableView)
    }
    
    func updateView(newSelectedFriends: [GWMFriendModel]?)
    {
        //TODO: update view
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GWMFriendViewController: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return contacts.numOfCatalogue()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.numOfFriendsInCatalogue(section)
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return contacts.nameOfCatalogue(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var friend = contacts.friendInCatalogue(indexPath.section, ofNumber: indexPath.row)
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        cell.textLabel.text = friend.name
        cell.detailTextLabel?.text = friend.telephone
        if let photo = friend.photo
        {
            //TODO:
        }
        return cell
    }
}

extension GWMFriendViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        func selectCell(cell: UITableViewCell?)
        {
            cell?.backgroundColor = UIColor.blueColor()
        }
        
        func unSelectCell(cell: UITableViewCell?)
        {
            cell?.backgroundColor = UIColor.clearColor()
        }
        
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
        let friendInfo = contacts.friendInCatalogue(indexPath.section, ofNumber: indexPath.row)

        switch(selectedFriends.addFriend(friendInfo))
        {
        case .Success:
            selectCell(tableView.cellForRowAtIndexPath(indexPath))
        case .Fail:
            return
        case .Repeat:
            unSelectCell(tableView.cellForRowAtIndexPath(indexPath))
            selectedFriends.removeSelectedFriend(friendInfo)
        }
    }
}

extension GWMFriendViewController
{
    //TODO:KVO
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>)
    {
        if selectedFriends != (object as? GWMSelectedFriendsModel)
        {
            return
        }
        else if keyPath != KVOSelectedFriendsList
        {
            return
        }
        else
        {
            if let changeKindValue = change[NSKeyValueChangeKindKey] as? UInt
            {
                if let changeKind = NSKeyValueChange(rawValue: changeKindValue)
                {
                    switch(changeKind)
                    {
                    case .Setting:
                        println("KVO Setting - friendVC")
                        updateView(change[NSKeyValueChangeNewKey] as [GWMFriendModel]?)
                    case .Removal:
                        println("KVO Removal - friendVC")
                    case .Replacement:
                        println("KVO Replacement - friendVC")
                    case .Insertion:
                        println("KVO Insertion - friendVC")
                    }
                }
            }
        }
    }
}
