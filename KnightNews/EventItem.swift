//
//  EventItem.swift
//  KnightNews
//
//  Created by james van gaasbeck on 12/22/14.
//  Copyright (c) 2014 james van gaasbeck. All rights reserved.
//

import Foundation

class EventItem: NSObject {
    var eventTitle: String {
        get{
            return self.eventTitle
        }
        set{
            self.eventTitle = newValue
        }
    }
    var eventDesc: String {
        get{
            return self.eventDesc
        }
        set{
            self.eventDesc = newValue
        }
    }
    var eventDate: String {
        get{
            return self.eventDate
        }
        set{
            self.eventDate = newValue
        }
    }
    
    
    

}
