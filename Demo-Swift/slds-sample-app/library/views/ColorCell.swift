// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class ColorCell: UITableViewCell {
    
    var color = UIColor.white
    var swatch = SwatchView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : ColorObject? {
        didSet {
            if let label = self.textLabel {
                label.text = dataProvider?.name.replacingOccurrences(of: "SLDSColorBackground", with: "")
                label.text = label.text?.replacingOccurrences(of: "SLDSColorBorder", with: "")
                label.text = label.text?.replacingOccurrences(of: "SLDSFill", with: "")
                label.text = label.text?.replacingOccurrences(of: "SLDSColorText", with: "")
                label.text = label.text?.replacingOccurrences(of: "SLDS", with: "")
                
                label.font = UIFont.sldsFont(.regular, with: .small)
            }
            swatch.dataProvider = dataProvider?.color
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        swatch.dataProvider = dataProvider?.color;
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        swatch.dataProvider = dataProvider?.color;
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let label = textLabel {
            var rect = label.frame
            rect.size.width = self.contentView.frame.width - 116
            label.frame = rect
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func makeLayout() {
        if let label = textLabel {
            label.lineBreakMode = .byTruncatingHead
        }
        
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.backgroundColor = UIColor.sldsBackgroundColor(.colorBackgroundRowSelected)
        
        self.contentView.addSubview(self.swatch)
        self.contentView.constrainChild(self.swatch,
                                        xAlignment: .right,
                                        yAlignment: .center,
                                        width: 70,
                                        height: 70,
                                        xOffset: 20)
    }
}
