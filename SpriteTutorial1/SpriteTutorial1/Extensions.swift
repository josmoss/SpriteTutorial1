//
//  Extensions.swift
//  SpriteTutorial1
//
//  Created by Joe Moss on 9/5/16.
//  Copyright © 2016 TouchType LLC. All rights reserved.
//

import Foundation

extension Dictionary {
    static func loadJSONFromBundle(filename: String) -> Dictionary <String, AnyObject>? {
        var dataOK: NSData
        var dictionaryOK: NSDictionary = NSDictionary()
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json") {
            let _: NSError?
            do {
                let data = try NSData(contentsOfFile: path, options: NSDataReadingOptions()) as NSData!
                dataOK = data
            }
            catch {
                print("Could not load level file: \(filename), error: \(error)")
                return nil
            }
            do {
                let dictionary = try NSJSONSerialization.JSONObjectWithData(dataOK, options: NSJSONReadingOptions()) as AnyObject!
                dictionaryOK = (dictionary as! NSDictionary as? Dictionary <String, AnyObject>)!
            }
            catch {
                print("Level file '\(filename)' is not vaild JSON: \(error)")
                return nil
            }
        }
        return dictionaryOK as? Dictionary <String, AnyObject> 
    }
}