/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class ColorViewController: UIViewController {
    
    var swatchName = UILabel()
    var swatch = SwatchView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : ColorObject? {
        didSet {
            guard let data = self.dataProvider else {
                return
            }
            
            self.swatchName.text = data.alias
            self.swatch.dataProvider = data.color
            self.codeView.swiftString = "UIColor." + data.method + "(." + data.alias + ")"
            self.codeView.objCString = "[UIColor " + data.method + " : " + data.alias + " ]"
        }
    }

    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        self.swatchName.textAlignment = .center
        self.swatchName.textColor = UIColor.sldsColorText(.default)
        self.swatchName.font = UIFont.sldsFont(.regular, with: .small)
        
        self.view.addSubview(self.swatch)
        self.view.addSubview(self.swatchName)
        self.view.addSubview(self.codeView)
        
        self.view.constrain(self.swatch,
                            inside: self.view,
                            xAlignment: .center,
                            yAlignment: .top,
                            width: 150,
                            height: 150,
                            yOffset: 30)
        
        self.view.constrain(self.swatchName,
                            verticallyTo: self.swatch,
                            xAlignment: .center,
                            direction: .down,
                            width: self.view.frame.width,
                            height: 50,
                            yOffset: 10)
        
        self.view.constrain(self.codeView,
                            inside: self.view,
                            xAlignment: .center,
                            yAlignment: .bottom,
                            width: self.view.frame.width,
                            height: self.view.frame.height/3)
    }

    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
