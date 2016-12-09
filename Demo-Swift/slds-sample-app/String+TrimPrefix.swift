//
//  String+EnumTrim.swift
//  slds-sample-app
//
//  Created by Joe Andolina on 12/9/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

extension String {

    func trimPrefix(_ prefix: String) -> String {
        var newName = self.replacingOccurrences(of: prefix, with: "")
        let first = String(newName.characters.prefix(1)).lowercased()
        var second = String(newName.characters.prefix(2).dropFirst())
        
        // NOTE : Special case for enums starting with XX
        if second == "X" {
            second = second.lowercased()
        }
        
        return first + second + String(newName.characters.dropFirst(2))
    }
}
