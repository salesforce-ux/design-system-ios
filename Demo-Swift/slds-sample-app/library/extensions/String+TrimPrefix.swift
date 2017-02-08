// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

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
