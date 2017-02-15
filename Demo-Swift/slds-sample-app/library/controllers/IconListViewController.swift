// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

class IconListViewController: SearchController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView : UICollectionView!
    var icons = [IconObject]()
    var filteredIcons = [IconObject]()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var utility : Bool {
        return self.title == IconObjectType.utility.rawValue
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var filterString : String {
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
        
        let backImg = UIImage.sldsUtilityIcon(.chevronleft, withSize: SLDSSquareIconUtilityLarge)
        self.navigationItem.backBarButtonItem?.setBackgroundImage(backImg, for: .normal, barMetrics: .default)
        
        styleCollectionView()
    }

    // MARK: Styling methods
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func styleCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height: self.view.frame.height - 90), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isAccessibilityElement = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "iconCell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
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
        
        cell.backgroundView = UIImageView(image:iconObj.getImage())
        cell.accessibilityLabel = iconObj.name
        cell.isAccessibilityElement = true
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
