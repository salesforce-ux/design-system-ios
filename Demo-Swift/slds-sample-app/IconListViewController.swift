class IconListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    var switchView: UISwitch!
    var switchHeader: UIView!
    var switchIcon: UIImageView!
    var searchField: SearchField!
    
    struct IconObject {
        var icon : UIImage!
        var name : String!
    }
    
    var icons = [IconObject]()
    var filteredIcons = [IconObject]()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addIcons() {
        
        // NOTE: Collecting all the Icon Names
        repeat {
            let icon = UIImage.sldsIconAction(SLDSIconActionType.init(rawValue: icons.count)!, withSize: 54)
            let name = NSString.sldsIconAction(SLDSIconActionType.init(rawValue: icons.count)!) as String
            icons.append(IconObject(icon: icon, name: name))
        } while SLDSIconActionType.init(rawValue: icons.count)?.hashValue != 0
        
        filteredIcons = icons
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: 75, height: 75)
        
        switchHeader = UIView()
        self.view.addSubview(switchHeader)
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: switchHeader, toItem: self.view, width: self.view.frame.width, height: 64, xAlignment: "center", yAlignment: "top", xOffset: 0, yOffset: 64))
        
        switchHeader.backgroundColor = UIColor.sldsColorBackground(.backgroundRowSelected)
        self.view.backgroundColor = UIColor.white
        
        switchView = UISwitch()
        switchView.onTintColor = UIColor.sldsColorBackground(.brand)
        switchView.offImage = UIImage.sldsIconUtility(.add, with: UIColor.black, andSize: 32)
        switchView.onImage = UIImage.sldsIconCustom(.custom3, withSize: 20)
        self.view.addSubview(switchView)
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: switchView, toItem: switchHeader, xAlignment: "right", yAlignment: "center", xOffset: -30, yOffset: 0))
        
        
        switchIcon = UIImageView(image: UIImage.sldsIconCustom(.custom3, with: UIColor.sldsColorText(.inputIcon), andBGColor: UIColor.sldsColorBackground(.backgroundRowSelected), andSize: 36))
        self.view.addSubview(switchIcon)
        self.view.addConstraints(ConstraintsHelper.stackH(item: switchIcon, toItem: switchView, center: true, invert: true, xOffset: -5, yOffset: 0))
        
        searchField = SearchField()
        self.view.addSubview(searchField)
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: searchField, toItem: switchHeader, width: 200, height: 36, xAlignment: "left", yAlignment: "center", xOffset: 30, yOffset: 0))
        
        searchField.addTarget(self, action: #selector(IconListViewController.filterIcons), for: UIControlEvents.editingChanged)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 128, width: self.view.frame.width, height: self.view.frame.height - 128), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
        switchView.addTarget(self, action: #selector(IconListViewController.switchIsChanged), for: UIControlEvents.valueChanged)
        
        self.addIcons()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func switchIsChanged(s: UISwitch) {
        if s.isOn {
            self.collectionView.backgroundColor = UIColor.sldsColorBackground(.backgroundAltInverse)
            switchIcon.image = UIImage.sldsIconCustom(.custom10, with: UIColor.sldsColorText(.inputIcon), andBGColor: UIColor.sldsColorBackground(.backgroundRowSelected), andSize: 36)
        } else {
            self.collectionView.backgroundColor = UIColor.white
            switchIcon.image = UIImage.sldsIconCustom(.custom3, with: UIColor.sldsColorText(.inputIcon), andBGColor: UIColor.sldsColorBackground(.backgroundRowSelected), andSize: 36)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredIcons.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func filterIcons(t: UITextField) {
        filteredIcons = icons.filter {
            if t.text == "" {
                return true
            } else {
                return ($0 as IconObject).name.range(of: t.text!) != nil
            }
        }
        self.collectionView.reloadData()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        
        let icon = filteredIcons[indexPath.item].icon
        
    
        let iconContainer = UIImageView(image: icon)
        cell.addSubview(iconContainer)
        cell.contentView.addSubview(iconContainer)
        cell.contentView.addConstraints(ConstraintsHelper.addConstraints(item: iconContainer, toItem: cell.contentView, xAlignment: "center", yAlignment: "center", xOffset: 0, yOffset: 0))
        
        return cell
    }
}
