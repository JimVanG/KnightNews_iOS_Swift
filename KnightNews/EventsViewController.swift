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
    var eventItem = EventItem()
    
    required init(coder aDecoder: NSCoder) {
        self.xmlParser = NSXMLParser(contentsOfURL: NSURL(string: "http://knightnews.com/events.xml"))!
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.xmlParser.delegate = self
        self.xmlParser.shouldResolveExternalEntities = false
        
        self.xmlParser.parse()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: NSXMLParser Delegate Methods
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        self.elementString = elementName
        
        if self.elementString == EVENT_NAME {
            self.eventItem = EventItem()
            
            self.tempName = ""
            self.tempDesc = ""
            self.tempDate = ""
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        
        if self.elementString == EVENT_NAME {
            self.tempName += string
        }
        else if self.elementString == EVENT_DATE {
            self.tempDate += string
            
        }else if self.elementString == EVENT_DESC {
            self.tempDesc += string
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        
        if self.elementString == EVENT_NAME {
            self.eventItem.eventTitle = self.tempName
        }
        else if self.elementString == EVENT_DATE {
            self.eventItem.eventDate = self.tempDate
            
        }else if self.elementString == EVENT_DESC {
            self.eventItem.eventDesc = self.tempDesc
            
            self.items.append( self.eventItem)
        }
    }

    func parserDidEndDocument(parser: NSXMLParser!) {
        self.tableView.reloadData()
        
        println(self.items)
    }
    

    // MARK: UITableView Methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventsTableViewCell", forIndexPath: indexPath) as EventsCell
        
        let eventItem = self.items[indexPath.row]
        
        cell.nameLabel.text = eventItem.eventTitle
        cell.descLabel.text = eventItem.eventDesc.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        cell.dateLabel.text = eventItem.eventDate.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        return cell
    }
}

