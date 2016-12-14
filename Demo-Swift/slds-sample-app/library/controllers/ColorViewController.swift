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
    var swatchRGB = UILabel()
    var swatchRGBValues = UILabel()
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
                swiftName = swiftName.trimPrefix("SLDSColor")
                
            case .border :
                swiftName = swiftName.trimPrefix("SLDSColorBorder")
                
            case .text :
                swiftName = swiftName.trimPrefix("SLDSColorText")
            }
            
            self.swatchName.text = data.name
            self.swatch.dataProvider = data.color
            
            self.codeView.objCParameters = ["UIColor", data.method, data.name]
            self.codeView.swiftParameters = ["UIColor", data.method, swiftName]
            
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            data.color?.getRed(&r, green: &g, blue: &b, alpha: &a)
            
            let hex:Int = Int(r*255)<<16 | Int(g*255)<<8 | Int(b*255)<<0
            swatchHEX.text = "hex: \(NSString(format:"#%06x", hex).uppercased)"
            swatchRGB.text = "\(Int(r*255)) \n\(Int(g*255)) \n\(Int(b*255)) \n\(Int(a*255))"
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
        
        self.swatchRGBValues.numberOfLines = 4
        self.swatchRGBValues.textAlignment = .right
        self.swatchRGBValues.textColor = UIColor.sldsColorText(.default)
        self.swatchRGBValues.font = UIFont.sldsFont(.regular, with: .small)
        self.swatchRGBValues.text = "r:\ng:\nb:\na:"
        
        self.swatchRGB.numberOfLines = 4
        self.swatchRGB.textAlignment = .left
        self.swatchRGB.textColor = UIColor.sldsColorText(.default)
        self.swatchRGB.font = UIFont.sldsFont(.regular, with: .small)
        
        self.swatchHEX.textAlignment = .center
        self.swatchHEX.textColor = UIColor.sldsColorText(.default)
        self.swatchHEX.font = UIFont.sldsFont(.regular, with: .small)
        
        self.view.addSubview(self.swatch)
        self.view.addSubview(self.swatchName)
        self.view.addSubview(self.swatchRGBValues)
        self.view.addSubview(self.swatchRGB)
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
        
        self.swatchRGBValues.constrainBelow(self.swatchHEX,
                                      xAlignment: .center,
                                      xOffset: -5,
                                      yOffset: 5)
        
        self.swatchRGB.constrainRightOf(self.swatchRGBValues,
                                        yAlignment: .center,
                                        xOffset: 5)
        
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
