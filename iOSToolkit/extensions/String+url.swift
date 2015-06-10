//
//  String+url.swift
//  iOSToolkit
//
//  Created by Freddie Wang on 2015/6/11.
//  Copyright (c) 2015年 freddie. All rights reserved.
//

import Foundation

public extension String {
    var urlEncodedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(
            NSCharacterSet(charactersInString: "!*'();:@&=+$,/?%#[]").invertedSet)!
    }
}