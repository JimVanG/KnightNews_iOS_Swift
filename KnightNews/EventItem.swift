//
//  EventItem.swift
//  KnightNews
//
//  Created by james van gaasbeck on 12/22/14.
//  Copyright (c) 2014 james van gaasbeck. All rights reserved.
//

import Foundation

class EventItem: NSObject {
    var eventTitle = String()
    var eventDesc = String()
    var eventDate = String()
    
    func description() -> String {
        
        return "\(self.eventTitle)\n\(self.eventDesc)\n\(self.eventDate)"
    }
}
