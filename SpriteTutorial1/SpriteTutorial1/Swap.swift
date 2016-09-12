//
//  Swap.swift
//  SpriteTutorial1
//
//  Created by Joe Moss on 9/6/16.
//  Copyright © 2016 TouchType LLC. All rights reserved.
//

import Foundation

struct Swap: CustomStringConvertible, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}

func ==(lhs: Swap, rhs: Swap) -> Bool {
    return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB) ||
           (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
}