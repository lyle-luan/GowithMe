//
//  GWMActionsViewController.swift
//  GowithMe
//
//  Created by Aaron on 2/5/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class GWMActionsViewController: UIViewController
{
    var selectedFriends :GWMSelectedFriendsModel! {
        didSet {
            
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
    }
}
