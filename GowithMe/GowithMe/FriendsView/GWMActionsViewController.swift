//
//  GWMActionsViewController.swift
//  GowithMe
//
//  Created by Aaron on 2/5/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

private enum ActionsWithFriend
{
    case Ask
    case Send
    case History
    case Delete
    case Rename
    //TODO: maybe more
}

class GWMActionsViewController: UIViewController
{
    var selectedFriends :GWMSelectedFriendsModel!
    private var actionsSupport: [ActionsWithFriend]?
    
    class func positionActions() -> GWMActionsViewController
    {
        let actionsViewController =  GWMActionsViewController()
        actionsViewController.actionsSupport = [.Ask, .Send]
        return actionsViewController
    }
    
    class func editActions() -> GWMActionsViewController
    {
        let actionsViewController =  GWMActionsViewController()
        actionsViewController.actionsSupport = [.History, .Delete, .Rename]
        return actionsViewController
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        if let hasActionsSupport = actionsSupport
        {
            for action in hasActionsSupport
            {
                switch(action)
                {
                case .Ask:
                    let view = GWMActionsView.askView()
                    view.addTarget(self, action: "askPositionOfSelectedFriends", forControlEvents: .TouchUpInside)
                    self.view.addSubview(view)
                case .Send:
                    let view = GWMActionsView.sendView()
                    view.addTarget(self, action: "sendPositionToSelectedFriends", forControlEvents: .TouchUpInside)
                    self.view.addSubview(view)
                case .History:
                    let view = GWMActionsView.historyView()
                    view.addTarget(self, action: "viewHisotryOfSelectedFriends", forControlEvents: .TouchUpInside)
                    self.view.addSubview(view)
                case .Delete:
                    let view = GWMActionsView.deleteView()
                    view.addTarget(self, action: "deleteSelectedFriends", forControlEvents: .TouchUpInside)
                    self.view.addSubview(view)
                case .Rename:
                    let view = GWMActionsView.renameView()
                    view.addTarget(self, action: "renameSelectedFriends", forControlEvents: .TouchUpInside)
                    self.view.addSubview(view)
                }
            }
        }
    }
}

extension GWMActionsViewController
{
    func askPositionOfSelectedFriends()
    {
        println("askPositionOfSelectedFriends")
    }
    
    func sendPositionToSelectedFriends()
    {
        println("sendPositionToSelectedFriends")
    }
    
    func viewHisotryOfSelectedFriends()
    {
        println("viewHisotryOfSelectedFriends")
    }
    
    func deleteSelectedFriends()
    {
        println("deleteSelectedFriends")
    }
    
    func renameSelectedFriends()
    {
        println("renameSelectedFriends")
    }
}

private class GWMActionsView: UIButton
{
    class func askView() -> GWMActionsView
    {
        let view = GWMActionsView(frame: CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0))
        
        view.backgroundColor = UIColor.yellowColor()
        view.setTitle("Ask", forState: .Normal)
        view.setTitleColor(UIColor.redColor(), forState: .Normal)
        view.titleLabel?.sizeToFit()
        view.titleLabel?.textAlignment = .Center
        
        return view
    }
    
    class func sendView() -> GWMActionsView
    {
        let view = GWMActionsView(frame: CGRect(x: 100.0, y: 0.0, width: 80.0, height: 80.0))
        
        view.backgroundColor = UIColor.yellowColor()
        view.setTitle("Send", forState: .Normal)
        view.setTitleColor(UIColor.redColor(), forState: .Normal)
        view.titleLabel?.sizeToFit()
        view.titleLabel?.textAlignment = .Center
        
        return view
    }
    
    class func historyView() -> GWMActionsView
    {
        let view = GWMActionsView(frame: CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0))
        
        view.backgroundColor = UIColor.yellowColor()
        view.setTitle("History", forState: .Normal)
        view.setTitleColor(UIColor.redColor(), forState: .Normal)
        view.titleLabel?.sizeToFit()
        view.titleLabel?.textAlignment = .Center
        
        return view
    }
    
    class func deleteView() -> GWMActionsView
    {
        let view = GWMActionsView(frame: CGRect(x: 100.0, y: 0.0, width: 80.0, height: 80.0))
        
        view.backgroundColor = UIColor.yellowColor()
        view.setTitle("Delete", forState: .Normal)
        view.setTitleColor(UIColor.redColor(), forState: .Normal)
        view.titleLabel?.sizeToFit()
        view.titleLabel?.textAlignment = .Center
        
        return view
    }
    
    class func renameView() -> GWMActionsView
    {
        let view = GWMActionsView(frame: CGRect(x: 200.0, y: 0.0, width: 80.0, height: 80.0))
        
        view.backgroundColor = UIColor.yellowColor()
        view.setTitle("Rename", forState: .Normal)
        view.setTitleColor(UIColor.redColor(), forState: .Normal)
        view.titleLabel?.sizeToFit()
        view.titleLabel?.textAlignment = .Center
        
        return view
    }
}