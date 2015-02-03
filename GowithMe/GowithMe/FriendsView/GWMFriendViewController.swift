//
//  GWMFriendViewController.swift
//  GowithMe
//
//  Created by Aaron on 2/3/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import Foundation
import UIKit

class GWMFriendViewController: UITableViewController
{
    private let contacts = GWMContacts()
}

extension GWMFriendViewController: UITableViewDataSource
{
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return contacts.numOfCatalogue()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.numOfFriendsInCatalogue(section)
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return contacts.nameOfCatalogue(section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var friend = contacts.friendInCatalogue(indexPath.section, number: indexPath.row)
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        cell.textLabel?.text = friend.name
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
    
}