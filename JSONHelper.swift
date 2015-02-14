/*
 * Copyright 2014 Kreto. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation and/or
 *    other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY Kireto “AS IS” WITHOUT ANY WARRANTIES WHATSOEVER.
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF NON INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE HEREBY DISCLAIMED. IN NO EVENT SHALL Kireto OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * The views and conclusions contained in the software and documentation are those of
 * the authors and should not be interpreted as representing official policies,
 * either expressed or implied, of Kireto.
 */

import UIKit
import Foundation

class JSONHelper: NSObject {
    
    class func intValueForKey(keyString: String, dictionary: NSDictionary) -> Int {
        
        var retValue: Int = 0
        if let value = dictionary[keyString] as? Int {
            retValue = value
        }
        else if let value = dictionary[keyString] as? String {
            retValue = value.toInt()!
        }
        return retValue
    }
    class func doubleValueForKey(keyString: String, dictionary: NSDictionary) -> Double {
        
        var retValue: Double = 0
        if let value = dictionary[keyString] as? Double {
            retValue = value
        }
        else if let value = dictionary[keyString] as? String {
            retValue = (value as NSString).doubleValue
        }
        return retValue
    }
    class func boolValueForKey(keyString: String, dictionary: NSDictionary) -> Bool {
        
        var retValue: Bool = false
        if let value = dictionary[keyString] as? Bool {
            retValue = value
        }
        return retValue
    }
    class func stringValueForKey(keyString: String, dictionary: NSDictionary) -> String {
        
        var retValue = ""
        if let value = dictionary[keyString] as? String {
            retValue = value
        }
        return retValue
    }
    class func stringValueForKey(keyString: String, dictionary: NSDictionary, failValue: String) -> String {
        
        var retValue = failValue
        if let value = dictionary[keyString] as? String {
            retValue = value
        }
        return retValue
    }
    class func resourceStringValueForKey(keyString: String, dictionary: NSDictionary) -> String {
        
        var retValue = ""
        if let value = dictionary[keyString] as? String {
            retValue = Globals.checkSanityForURLstring(value)
        }
        return retValue
    }
    class func arrayValueForKey(keyString: String, dictionary: NSDictionary) -> NSArray {
        
        var retValue : NSArray = NSArray()
        if let value = dictionary[keyString] as? NSArray {
            retValue = value
        }
        return retValue
    }
    class func dictValueForKey(keyString: String, dictionary: NSDictionary) -> NSDictionary {
        
        var retValue : NSDictionary = NSDictionary()
        if let value = dictionary[keyString] as? NSDictionary {
            retValue = value
        }
        return retValue
    }
    class func dateValueForKey(keyString: String, dictionary: NSDictionary) -> NSDate {
        
        var retValue: NSDate = NSDate()
        var dateString = JSONManager.stringValueForKey(keyString, dictionary: dictionary)
        if !dateString.isEmpty {
            
            let dateStringFormatter = NSDateFormatter()
            dateStringFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"
            retValue = dateStringFormatter.dateFromString(dateString)! as NSDate
        }
        return retValue
    }
    class func dateValueForKey(keyString: String, dictionary: NSDictionary, dateStringFormatter: NSDateFormatter) -> NSDate {
        
        var retValue: NSDate = NSDate()
        var dateString = JSONManager.stringValueForKey(keyString, dictionary: dictionary)
        if !dateString.isEmpty {
            retValue = dateStringFormatter.dateFromString(dateString)!
        }
        return retValue
    }
}
