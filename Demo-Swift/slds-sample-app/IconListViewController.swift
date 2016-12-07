

enum IconListType : String {
    case action = "Action"
    case custom = "Custom"
    case standard = "Standard"
    case utility = "Utility"
}

struct IconObject {
    var icon : UIImage!
    var name : String!
    var method : String!
    var index: Int!
}

class IconListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITextFieldDelegate {

    var collectionView: UICollectionView!
    var switchView: UISwitch!
    var switchHeader: UIView!
    var switchIcon: UIImageView!
    var searchField = SearchField()
    var utility = false
    
    let accentBorderColor = UIColor.sldsColorBorder(.input)
    let accentTextColor = UIColor.sldsColorText(.inputIcon)
    
    var lightIcon: UIImage!
    var darkIcon: UIImage!
    
    var tap: UITapGestureRecognizer!
    
    var darkMode = false
    
    var icons = [IconObject]()
    //var filteredIcons = [IconObject]()
    
    var filterString = ""
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var filteredIcons : [IconObject] {
        return self.icons.filter {
            if filterString == "" {
                return true
            } else {
                return ($0 as IconObject).name.lowercased().range(of: filterString) != nil
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var title: String? {
        didSet {
            super.title = self.title
            if let newTitle = self.title {
                self.addContent(newTitle)
            }
        }
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
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func styleSearch() {
        searchField.delegate = self;
        searchField.keyboardType = .alphabet
        searchField.returnKeyType = .done
        searchField.autocapitalizationType = .none
        searchField.autocorrectionType = .no
        switchHeader.addSubview(searchField)
        
        switchHeader.constrainChild(searchField,
                                    xAlignment: .left,
                                    yAlignment: .center,
                                    width: self.view.frame.width - 96 - switchView.frame.width,
                                    height: 40,
                                    xOffset: 20)
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

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
//        filteredIcons = filteredIcons.map {
//            let iconObj = $0 as IconObject
//            return IconObject(icon: (UIImage.sldsIconUtility(SLDSIconUtilityType.init(rawValue: iconObj.index)!, with: c, andSize: 40)),
//                              name: iconObj.name,
//                              method:"sldsIconUtility",
//                              index: iconObj.index )
//        }
        self.collectionView.reloadData()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func switchIsChanged(s: UISwitch) {
        if s.isOn {
            if utility {
                updateUtilitycolor()
            }
            self.collectionView.backgroundColor = UIColor.sldsColorBackground(.backgroundInverse)
            switchIcon.image = darkIcon
            darkMode = true
        } else {
            if utility {
                updateUtilitycolor()
            }
            self.collectionView.backgroundColor = UIColor.white
            switchIcon.image = lightIcon
            darkMode = false
        }
    }
    
    // Mark - Data Management
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addContent(_ iconType: String) {
        
        var iconList = Array<IconObject>()
        var indexPath : IndexPath
        
        switch iconType {
        case IconListType.action.rawValue : indexPath = IndexPath(item: 0, section: 0)
        case IconListType.custom.rawValue : indexPath = IndexPath(item: 0, section: 1)
        case IconListType.standard.rawValue : indexPath = IndexPath(item: 0, section: 2)
        case IconListType.utility.rawValue : indexPath = IndexPath(item: 0, section: 3)
        default : return
        }
        
        while let icon = self.iconAt(indexPath) {
            iconList.append(icon)
            indexPath.item = iconList.count
        }
        
        self.icons.removeAll()
        self.icons.append(contentsOf: iconList)
        
        //self.filteredIcons.removeAll()
        //self.filteredIcons.append(contentsOf: self.icons)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func iconAt(_ indexPath: IndexPath) -> IconObject? {
        
        var retVal : IconObject?
        
        switch indexPath.section {
        case 0 :
            if indexPath.item > 0 && (SLDSIconActionType.init(rawValue: indexPath.item)?.hashValue == 0) {
                break
            }
            
            if let value = SLDSIconActionType.init(rawValue: indexPath.item) {
                retVal = IconObject(icon: (UIImage.sldsIconAction(value, withSize: SLDSSquareIconLarge)),
                                    name: NSString.sldsIconAction(value) as String,
                                    method : "sldsIconAction",
                                    index : indexPath.item )
            }
            
        case 1 :
            if indexPath.item > 0 && (SLDSIconCustomType.init(rawValue: indexPath.item)?.hashValue == 0) {
                break
            }
            
            if let value = SLDSIconCustomType.init(rawValue: indexPath.item) {
                retVal = IconObject(icon: (UIImage.sldsIconCustom(value, withSize: SLDSSquareIconLarge)),
                                    name: NSString.sldsIconCustom(value) as String,
                                    method : "sldsIconCustom",
                                    index : indexPath.item )
            }
            
        case 2 :
            if indexPath.item > 0 && (SLDSIconStandardType.init(rawValue: indexPath.item)?.hashValue == 0) {
                break
            }
            
            if let value = SLDSIconStandardType.init(rawValue: indexPath.item) {
                retVal = IconObject(icon: (UIImage.sldsIconStandard(value, withSize: SLDSSquareIconLarge)),
                                    name: NSString.sldsIconStandard(value) as String,
                                    method : "sldsIconStandard",
                                    index : indexPath.item )
            }
            
        case 3 :
            if indexPath.item > 0 && (SLDSIconUtilityType.init(rawValue: indexPath.item)?.hashValue == 0) {
                break
            }
            
            if let value = SLDSIconUtilityType.init(rawValue: indexPath.item) {
                retVal = IconObject(icon: UIImage.sldsIconUtility(value, with: UIColor.sldsColorBackground(.backgroundIconWaffle), andSize: SLDSSquareIconMedium),
                                    name: NSString.sldsIconUtility(value) as String,
                                    method : "sldsIconUtility",
                                    index : indexPath.item )
            }
            
        default : break
        }
        
        return retVal
    }
    
    // Mark - UITextFieldDelegate
    //–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldText: NSString = (textField.text ?? "") as NSString
        self.filterString = textFieldText.replacingCharacters(in: range, with: string).lowercased()
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        return true
    }

    // Mark - UICollectionViewDataSource implementation
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredIcons.count
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        
        let icon = filteredIcons[indexPath.item].icon
        let iconContainer = UIImageView(image: icon)
        
        if utility {
            iconContainer.backgroundColor = darkMode ? UIColor.sldsColorBackground(.backgroundInverse) : UIColor.white
        }
        
        cell.addSubview(iconContainer)
        cell.contentView.addSubview(iconContainer)
        
        cell.contentView.constrainChild(iconContainer,
                                        xAlignment: .center,
                                        yAlignment: .center)
        
        return cell
    }
    
    // Mark - UICollectionViewDelegateFlowLayout implementation
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = IconViewController()
        controller.dataProvider = filteredIcons[indexPath.item]
        self.navigationController?.show(controller, sender: self)
    }

}
