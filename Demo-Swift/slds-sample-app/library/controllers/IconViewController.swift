/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class IconViewController: UIViewController {
    
    var iconSmall = UIImageView()
    var iconMedium = UIImageView()
    var iconLarge = UIImageView()
    var iconInfo = UILabel()
    var codeView = CodeView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : IconObject? {
        didSet {
            guard var data = self.dataProvider else {
                return
            }
            
            data.size = SLDSSquareIconSmall
            iconSmall = UIImageView(image: data.getImage())
            
            data.size = SLDSSquareIconMedium
            iconMedium = UIImageView(image: data.getImage())
            
            data.size = SLDSSquareIconLarge
            iconLarge = UIImageView(image: data.getImage())
            
            self.iconInfo.text = data.name
            
            var swiftName = data.name
            switch data.type {
                case .action :
                    swiftName = swiftName.trimPrefix("SLDSIconAction")
                    
                case .custom :
                    swiftName = swiftName.trimPrefix("SLDSIcon")
                    
                case .standard :
                    swiftName = swiftName.trimPrefix("SLDSIconStandard")
                    
                case .utility :
                    swiftName = swiftName.trimPrefix("SLDSIconUtility")
            }
            
            self.codeView.swiftParameters = ["UIImage", data.method, swiftName, "withSize", "SLDSSquareIconMedium"]
            self.codeView.objCParameters = ["UIImage", data.method, data.name, "withSize", "SLDSSquareIconMedium"]
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        self.iconInfo.textAlignment = .center
        self.iconInfo.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.iconInfo.font = UIFont.sldsFont(.regular, with: .small)
        self.view.addSubview(self.iconInfo)
        
        self.view.addSubview(codeView)
        self.view.constrainChild(self.codeView,
                                 xAlignment: .center,
                                 yAlignment: .bottom,
                                 width: self.view.frame.width,
                                 height: self.view.frame.height/3)
        
        self.view.addSubview(iconSmall)
        self.view.addSubview(iconMedium)
        self.view.addSubview(iconLarge)
        
        self.view.constrainChild(iconMedium,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 xOffset: -10,
                                 yOffset: 70)
        
        iconSmall.constrainLeftOf(iconMedium,
                                  yAlignment: .center,
                                  xOffset: 30)
        
        iconLarge.constrainRightOf(iconMedium,
                                    yAlignment: .center,
                                    xOffset: 30)
        
        self.view.constrainChild(self.iconInfo,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 yOffset: 140)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
