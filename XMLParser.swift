//
//  XMLParser.swift
//  Spt
//
//  Created by Karl Taylor on 2/1/17.
//  Copyright © 2017 Sonne & Taylor. All rights reserved.
//

import UIKit

class XMLParser: NSObject, XMLParserDelegate {
    
    var arrParsedData = [Dictionary<String, String>]()
    
    var currentDataDictionary = Dictionary<String, String>()
    
    var currentElement = ""
    
    var foundCharacters = ""
    var delegate : XMLParserDelegate?
    
    func startParsingWithContentsOfURL(rssURL: NSURL) {
        let parser = XMLParser(contentsOfURL: rssURL)
        parser.delegate = self
        parser.parse()
    }
    
    func parser(parser:XMLParser, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]) {
        
        currentElement = elementName
    }
    
    func parser(parser:XMLParser, foundCharacters string: String!) {if (currentElement == "title" && currentElement != "Appcoda") || currentElement == "link" || currentElement == "pubDate"{foundCharacters += string}
    }
    func parser(parser:XMLParser, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if !foundCharacters.isEmpty {
            
            if elementName == "link"{
                foundCharacters = (foundCharacters as NSString).substring(from: 3)
            }
            
            currentDataDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "pubDate" {
                arrParsedData.append(currentDataDictionary)
            }
        }
    }
    
    @objc protocol XMLParserDelegate{
        func parsingWasFinished()
    }
    func parserDidEndDocument(parser: XMLParser) {
        delegate?.parsingWasFinished()
    }
    
    func parser(parser: XMLParser, parseErrorOccurred parseError: NSError!) {
        println(parseError.description)
    }
    
    
    func parser(parser: NSXMLParser, validationErrorOccurred validationError: NSError!) {
        println(validationError.description)
    }
    
}
