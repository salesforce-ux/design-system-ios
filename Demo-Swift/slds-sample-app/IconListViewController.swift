

class IconListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITextFieldDelegate {

    var collectionView : UICollectionView!
    var switchView = UISwitch()
    var switchHeader = UIView()
    var switchIcon = UIImageView()
    var searchField = SearchField()
    var icons = [IconObject]()
    var filteredIcons = [IconObject]()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var lightIcon = UIImage.sldsIconCustom(.custom3,
                                           with: .sldsColorText(.inputIcon),
                                           andBGColor: .sldsColorBackground(.background),
                                           andSize: SLDSSquareIconMedium)
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var darkIcon = UIImage.sldsIconCustom(.custom10,
                                          with: .sldsColorText(.inputIcon),
                                          andBGColor: .sldsColorBackground(.background),
                                          andSize: SLDSSquareIconMedium)
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var tap = UITapGestureRecognizer(target: self, action: #selector(IconListViewController.dismissKeyboard))
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var cellBackgroundColor : UIColor {
        return switchView.isOn ? UIColor.white : UIColor.sldsColorBackground(.backgroundIconWaffle)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var utility : Bool {
        return self.title == IconObjectType.utility.rawValue
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var filterString : String = "" {
        didSet {
            self.filteredIcons = self.icons.filter {
                if self.filterString == "" {
                    return true
                } else {
                    return ($0 as IconObject).name.lowercased().range(of: filterString) != nil
                }
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var title: String? {
        didSet {
            super.title = self.title
            switch self.title! {
                case IconObjectType.action.rawValue :
                    self.icons = ApplicationModel.sharedInstance.actionIcons
                case IconObjectType.custom.rawValue :
                    self.icons = ApplicationModel.sharedInstance.customIcons
                case IconObjectType.standard.rawValue :
                    self.icons = ApplicationModel.sharedInstance.standardIcons
                case IconObjectType.utility.rawValue :
                    self.icons = ApplicationModel.sharedInstance.utilityIcons
                default : break
            }
            self.filterString = ""
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let backImg = UIImage.sldsIconUtility(.chevronleft, with: UIColor.white, andSize: SLDSSquareIconUtilityLarge)
        self.navigationItem.backBarButtonItem?.setBackgroundImage(backImg, for: .normal, barMetrics: .default)
        
        styleHeader()
        styleSwitch()
        styleSearch()
        styleCollectionView()
    }

    // MARK: Styling methods
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func styleHeader() {
        switchHeader.backgroundColor = UIColor.sldsColorBackground(.background)
        self.view.addSubview(switchHeader)
        self.view.constrainChild(switchHeader,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 width: self.view.frame.width,
                                 height: 64,
                                 yOffset: 64)
        
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func styleSwitch() {
        switchView.onTintColor = UIColor.sldsColorBorder(.input)
        switchView.tintColor = UIColor.white
        switchView.layer.borderColor = UIColor.sldsColorBorder(.input).cgColor
        switchView.layer.borderWidth = 1
        switchView.layer.cornerRadius = 16
        switchView.addTarget(self, action: #selector(IconListViewController.switchIsChanged), for: UIControlEvents.valueChanged)
        
        switchHeader.addSubview(switchView)
        switchHeader.constrainChild(switchView,
                                    xAlignment: .right,
                                    yAlignment: .center,
                                    xOffset: 20)
        
        switchIcon.image = lightIcon
        self.view.addSubview(switchIcon)
        switchIcon.constrainLeftOf(switchView,
                                   yAlignment: .center,
                                   xOffset: 5)
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
    
    func styleCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 128, width: self.view.frame.width, height: self.view.frame.height - 128), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "iconCell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }
    
    // MARK: Event handling
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func switchIsChanged(s: UISwitch) {
        if s.isOn {
            self.collectionView.backgroundColor = UIColor.sldsColorBackground(.backgroundInverse)
            switchIcon.image = darkIcon
        } else {
            self.collectionView.backgroundColor = UIColor.white
            switchIcon.image = lightIcon
        }
        
        if utility {
            self.collectionView.reloadData()
        }
    }

    
    // MARK: UITextFieldDelegate
    //–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchField {
            self.dismissKeyboard()
        }
        return false
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchField {
            self.view.addGestureRecognizer(tap)
            searchField.focus(true)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldText: NSString = (textField.text ?? "") as NSString
        self.filterString = textFieldText.replacingCharacters(in: range, with: string).lowercased()
        return true
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func dismissKeyboard() {
        searchField.focus(false)
        searchField.resignFirstResponder()
        self.view.removeGestureRecognizer(tap)
        self.view.endEditing(true)
    }

    // MARK: UICollectionViewDataSource implementation
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredIcons.count
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath as IndexPath)
        
        let iconObj = filteredIcons[indexPath.item]
        
        if utility {
            cell.backgroundView = UIImageView(image:iconObj.getImage(backgroundColor: self.cellBackgroundColor))
        }
        else
        {
            cell.backgroundView = UIImageView(image:iconObj.getImage())
        }
        
        cell.backgroundView?.contentMode = .center
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout implementation
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = IconViewController()
        controller.dataProvider = filteredIcons[indexPath.item]
        self.navigationController?.show(controller, sender: self)
    }

}
