//
//  GWMFriendIcon.swift
//  GowithMe
//
//  Created by Aaron on 2/9/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class GWMFriendIconView: UIButton
{
    init(friendInfo: GWMFriendModel, index: Int)
    {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0))
        backgroundColor = UIColor.yellowColor()
        setTitle(friendInfo.name, forState: .Normal)
        setTitleColor(UIColor.redColor(), forState: .Normal)
        titleLabel?.sizeToFit()
        titleLabel?.textAlignment = .Center
        tag = index
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
