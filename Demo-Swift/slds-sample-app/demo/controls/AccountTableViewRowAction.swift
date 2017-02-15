/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class AccountTableViewRowAction: UITableViewRowAction {
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = self.imageView?.frame;
        frame = CGRect(x:((self.bounds.size.width - (frame?.size.width)!) / 2), y: 8, width: (frame?.size.width)!, height: (frame?.size.height)!);
        self.imageView?.frame = frame!;
        
        // round icon
        imageView?.layer.cornerRadius = (frame?.width)!/2;
        imageView?.clipsToBounds = true;
        
        frame = self.titleLabel?.frame;
        frame = CGRect(x: ((self.bounds.size.width - (frame?.size.width)!) / 2), y: self.bounds.size.height - (frame?.size.height)! - 4, width: (frame?.size.width)!, height: (frame?.size.height)!);
        self.titleLabel?.frame = frame!;
        
        // styling
        self.titleLabel?.font = UIFont.sldsFont(.regular, with: .xSmall)
        self.titleLabel?.textColor = UIColor.sldsColorText(SLDSColorTextType.actionLabel)
    }
}
