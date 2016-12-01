class IconCell: UICollectionViewCell {

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func makeLayout() {
        let aaa = UILabel()
        aaa.text = "dasdsd"
        aaa.textColor = UIColor.green
        self.contentView.addSubview(aaa)
        self.contentView.addConstraints(ConstraintsHelper.addConstraints(item: aaa, toItem: self.contentView, xAlignment: .center, yAlignment: .center, xOffset: 0, yOffset: 0))
    }
}
