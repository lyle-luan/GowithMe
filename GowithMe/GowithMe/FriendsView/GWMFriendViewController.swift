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
    private let contacts = GWMContacts()
    private let selectedFriendsViewController = GWMSelectedFriendsViewController()
    private let actionsViewController = GWMActionsViewController()
    private let selectedFriends = GWMSelectedFriendsModel()
    
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
        var friend = contacts.friendInCatalogue(catalogue: indexPath.section, number: indexPath.row)
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
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
        selectedFriends.addFriend(contacts.friendInCatalogue(catalogue: indexPath.section, number: indexPath.row))
    }
}