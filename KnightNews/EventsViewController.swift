//
//  SecondViewController.swift
//  KnightNews
//
//  Created by james van gaasbeck on 12/22/14.
//  Copyright (c) 2014 james van gaasbeck. All rights reserved.
//

import UIKit

class EventsViewController: UITableViewController, NSXMLParserDelegate {

    let EVENT_NAME = "event_name"
    let EVENT_DATE = "event_date"
    let EVENT_DESC = "event_desc"
    
    let xmlParser: NSXMLParser
    var tempName: String = ""
    var tempDate: String = ""
    var tempDesc: String = ""
    var elementString: String = ""
    var items = [EventItem]()
    
    required init(coder aDecoder: NSCoder) {
        xmlParser = NSXMLParser()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

