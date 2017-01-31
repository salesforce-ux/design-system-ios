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
    
    var swatch = SwatchView()
    var swatchName = UILabel()
    var swatchR = UILabel()
    var swatchG = UILabel()
    var swatchB = UILabel()
    var swatchA = UILabel()
    var swatchHEX = UILabel()
    var codeView = CodeView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : ColorObject? {
        didSet {
            guard let data = self.dataProvider else {
                return
            }
            
            var swiftName = data.name
            switch data.type {
            case .background :
                swiftName = swiftName.trimPrefix("SLDS")
                
            case .border :
                swiftName = swiftName.trimPrefix("SLDS")
                
            case .fill :
                swiftName = swiftName.trimPrefix("SLDSFill")
                
            case .text :
                swiftName = swiftName.trimPrefix("SLDS")
            }
            
            self.swatchName.text = data.name
            self.swatch.dataProvider = data.color
            
            self.codeView.objCParameters = ["UIColor", data.method, data.name]
            self.codeView.swiftParameters = ["UIColor", data.method, swiftName]
            
            UIColor.sldsBackgroundColor(.cardColorBackground)
            
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            data.color?.getRed(&r, green: &g, blue: &b, alpha: &a)
            
            let hex:Int = Int(r*255)<<16 | Int(g*255)<<8 | Int(b*255)<<0
            swatchHEX.text = "hex: \(NSString(format:"#%06x", hex).uppercased)"
            swatchR.text = "R: \(Int(r*255))"
            swatchG.text = "G: \(Int(g*255))"
            swatchB.text = "B: \(Int(b*255))"
            swatchA.text = "A: \(Int(a*255))"
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        self.swatchName.textAlignment = .center
        self.swatchName.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.swatchName.font = UIFont.sldsFont(.regular, with: .small)
        
        self.swatchR.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.swatchR.font = UIFont.sldsFont(.regular, with: .small)
        self.swatchR.textAlignment = .left
    
        self.swatchG.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.swatchG.font = UIFont.sldsFont(.regular, with: .small)
        self.swatchG.textAlignment = .left
        
        self.swatchB.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.swatchB.font = UIFont.sldsFont(.regular, with: .small)
        self.swatchB.textAlignment = .left
        
        self.swatchA.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.swatchA.font = UIFont.sldsFont(.regular, with: .small)
        self.swatchA.textAlignment = .left
        
        self.swatchHEX.textAlignment = .center
        self.swatchHEX.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.swatchHEX.font = UIFont.sldsFont(.regular, with: .small)
        
        self.view.addSubview(self.swatch)
        self.view.addSubview(self.swatchName)
        self.view.addSubview(self.swatchR)
        self.view.addSubview(self.swatchG)
        self.view.addSubview(self.swatchB)
        self.view.addSubview(self.swatchA)
        self.view.addSubview(self.swatchHEX)
        self.view.addSubview(self.codeView)
        
        self.view.constrainChild(self.swatch,
                                  xAlignment: .center,
                                  yAlignment: .top,
                                  width: 150,
                                  height: 150,
                                  yOffset: 60)
        
        self.swatchName.constrainBelow(self.swatch,
                                       xAlignment: .center,
                                       width: self.view.frame.width,
                                       yOffset: 8)
        
        self.swatchHEX.constrainBelow(self.swatchName,
                                      xAlignment: .center,
                                      width: self.view.frame.width,
                                      yOffset: 8)
        
        self.swatchR.constrainBelow(self.swatchHEX,
                                    xAlignment: .center,
                                    width: 50,
                                    xOffset: -5,
                                    yOffset: 5)

        self.swatchG.constrainBelow(self.swatchR,
                                    xAlignment: .center,
                                    width: 50,
                                    xOffset: -1, // The G is a pixel wider than the other letters
                                    yOffset: 3)

        self.swatchB.constrainBelow(self.swatchG,
                                    xAlignment: .center,
                                    width: 50,
                                    xOffset: 1,
                                    yOffset: 3)

        self.swatchA.constrainBelow(self.swatchB,
                                    xAlignment: .center,
                                    width: 50,
                                    yOffset: 3)
        
        self.view.constrainChild(self.codeView,
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
