

enum IconListType : String {
    case action = "Action"
    case custom = "Custom"
    case standard = "Standard"
    case utility = "Utility"
}

class IconListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITextFieldDelegate {

    var collectionView: UICollectionView!
    var switchView: UISwitch!
    var switchHeader: UIView!
    var switchIcon: UIImageView!
    var searchField: SearchField!
    var utility: Bool!
    
    let accentBorderColor = UIColor.sldsColorBorder(.input)
    let accentTextColor = UIColor.sldsColorText(.inputIcon)
    
    var lightIcon: UIImage!
    var darkIcon: UIImage!
    
    var tap: UITapGestureRecognizer!
    
    struct IconObject {
        var icon : UIImage!
        var name : String!
        var index: Int!
    }
    
    var darkMode = false
    
    var icons = [IconObject]()
    var filteredIcons = [IconObject]()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var title: String? {
        didSet {
            super.title = self.title
            if let newTitle = self.title {
                self.addContent(newTitle)
                if self.title == "Utility" {
                    utility = true
                } else {
                    utility = false
                }
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addContent(_ iconType: String) {
        
        var maxFlag = true
        var i = Array<IconObject>()
        
        repeat {
            switch iconType {
                
            case IconListType.action.rawValue:
                if let value = SLDSIconActionType.init(rawValue: i.count) {
                    i.append(IconObject(icon: (UIImage.sldsIconAction(value, withSize: 48)),
                                        name: NSString.sldsIconAction(value) as String,
                                        index: i.count ))
                }
                
                maxFlag = SLDSIconActionType.init(rawValue: i.count)?.hashValue != 0
                
            case IconListType.custom.rawValue:
                if let value = SLDSIconCustomType.init(rawValue: i.count) {
                    i.append(IconObject(icon: (UIImage.sldsIconCustom(value, withSize: 48)),
                                        name: NSString.sldsIconCustom(value) as String,
                                        index: i.count ))
                }
                maxFlag = SLDSIconCustomType.init(rawValue: i.count)?.hashValue != 0
                
            case IconListType.utility.rawValue:
                if let value = SLDSIconUtilityType.init(rawValue: i.count) {
                    i.append(IconObject(icon: (UIImage.sldsIconUtility(value, with: UIColor.sldsColorBackground(.backgroundIconWaffle), andSize: 40)),
                                        name: NSString.sldsIconUtility(value) as String,
                                        index: i.count ))
                }
                maxFlag = SLDSIconUtilityType.init(rawValue: i.count)?.hashValue != 0
                
            case IconListType.standard.rawValue:
                if let value = SLDSIconStandardType.init(rawValue: i.count) {
                    i.append(IconObject(icon: (UIImage.sldsIconStandard(value, withSize: 48)),
                                        name: NSString.sldsIconStandard(value) as String,
                                        index: i.count ))
                }
                maxFlag = SLDSIconStandardType.init(rawValue: i.count)?.hashValue != 0
                
                
            default : maxFlag = false
                
            }
            
        } while maxFlag
        
        // NOTE : Commit the new values
        self.icons = i
        filteredIcons = self.icons
    }
    
    // MARK: - Styling methods
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func styleCollectionView(_ layout: UICollectionViewFlowLayout) {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 128, width: self.view.frame.width, height: self.view.frame.height - 128), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }
    
    func styleSearch() {
        searchField = SearchField()
        switchHeader.addSubview(searchField)
        
        switchHeader.constrainChild(searchField,
                                    xAlignment: .left,
                                    yAlignment: .center,
                                    width: self.view.frame.width - 96 - switchView.frame.width,
                                    height: 40,
                                    xOffset: 20)
        
        searchField.addTarget(self, action: #selector(IconListViewController.filterIcons), for: UIControlEvents.editingChanged)
        searchField.delegate = self;
        searchField.returnKeyType = .done
    }
    
    func styleSwitch() {
        switchView = UISwitch()
        switchView.onTintColor = accentBorderColor
        switchView.tintColor = UIColor.white
        switchView.layer.borderColor = accentBorderColor?.cgColor
        switchView.layer.borderWidth = 1
        switchView.layer.cornerRadius = 16
        switchHeader.addSubview(switchView)
        
        switchHeader.constrainChild(switchView,
                                    xAlignment: .right,
                                    yAlignment: .center,
                                    xOffset: 20)
        
        switchIcon = UIImageView(image: lightIcon)
        self.view.addSubview(switchIcon)
        
        switchIcon.constrainLeftOf(switchView,
                                   yAlignment: .center,
                                   xOffset: 5)
        
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func styleHeader() {
        switchHeader = UIView()
        self.view.addSubview(switchHeader)
        
        self.view.constrainChild(switchHeader,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 width: self.view.frame.width,
                                 height: 64,
                                 yOffset: 64)
        
        switchHeader.backgroundColor = UIColor.sldsColorBackground(.background)
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        lightIcon = UIImage.sldsIconCustom(.custom3, with: accentTextColor, andBGColor: UIColor.sldsColorBackground(.background), andSize: SLDSSquareIconMedium)
        darkIcon = UIImage.sldsIconCustom(.custom10, with: accentTextColor, andBGColor: UIColor.sldsColorBackground(.background), andSize: SLDSSquareIconMedium)
        
        styleHeader()
        styleSwitch()
        styleSearch()
        styleCollectionView(layout)
        
        switchView.addTarget(self, action: #selector(IconListViewController.switchIsChanged), for: UIControlEvents.valueChanged)
        tap = UITapGestureRecognizer(target: self, action: #selector(IconListViewController.dismissKeyboard))
    }
    
    // MARK: - Textfield delegate
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchField {
            textField.resignFirstResponder()
            searchField.focus(false)
            self.view.removeGestureRecognizer(tap)
            return false
        }
        return true
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchField {
            self.view.addGestureRecognizer(tap)
            searchField.focus(true)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func dismissKeyboard() {
        searchField.focus(false)
        self.view.removeGestureRecognizer(tap)
        self.view.endEditing(true)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func updateUtilitycolor() {
        let c = darkMode ? UIColor.sldsColorBackground(.backgroundIconWaffle) : UIColor.white
        filteredIcons = filteredIcons.map {
            let iconObj = $0 as IconObject
            return IconObject(icon: (UIImage.sldsIconUtility(SLDSIconUtilityType.init(rawValue: iconObj.index)!, with: c, andSize: 40)),
                              name: iconObj.name,
                              index: iconObj.index )
        }
        self.collectionView.reloadData()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func switchIsChanged(s: UISwitch) {
        if s.isOn {
            if utility! {
                updateUtilitycolor()
            }
            self.collectionView.backgroundColor = UIColor.sldsColorBackground(.backgroundInverse)
            switchIcon.image = darkIcon
            darkMode = true
        } else {
            if utility! {
                updateUtilitycolor()
            }
            self.collectionView.backgroundColor = UIColor.white
            switchIcon.image = lightIcon
            darkMode = false
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
                return ($0 as IconObject).name.lowercased().range(of: (t.text?.lowercased())!) != nil
            }
        }
        self.collectionView.reloadData()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = IconViewController()
        self.navigationController?.show(controller, sender: self)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        
        let icon = filteredIcons[indexPath.item].icon
        let iconContainer = UIImageView(image: icon)
        
        if utility! {
            iconContainer.backgroundColor = darkMode ? UIColor.sldsColorBackground(.backgroundInverse) : UIColor.white
        }
        
        cell.addSubview(iconContainer)
        cell.contentView.addSubview(iconContainer)
        
        cell.contentView.constrainChild(iconContainer,
                                        xAlignment: .center,
                                        yAlignment: .center)
        
        return cell
    }
}
