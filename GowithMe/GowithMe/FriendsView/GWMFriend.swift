//
//  GWMFriend.swift
//  GowithMe
//
//  Created by Aaron on 2/3/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import Foundation
import UIKit

class GWMFriend
{
    private let id: Int = -1
    let name: String?
    let telephone: String?
    lazy var photo: UIImage? = self.fetchImage()
    
    init(name:String?, telephone:String?)
    {
        self.name = name
        self.telephone = telephone
        self.id = self.generateID()
    }
    
    private func generateID() -> Int
    {
        return 1
    }
    
    private func fetchImage() -> UIImage?
    {
        return nil
    }
}