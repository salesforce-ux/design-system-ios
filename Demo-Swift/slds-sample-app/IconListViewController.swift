class IconListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    struct IconObject {
        var icon : UIImage!
        var name : String!
    }
    
    var icons = [IconObject]()
    
    func addIcons() {
        
        // NOTE: Collecting all the Font Names
        repeat {
            let icon = UIImage.sldsIconAction(SLDSIconActionType.init(rawValue: icons.count)!, withSize: 48)
            let name = NSString.sldsIconAction(SLDSIconActionType.init(rawValue: icons.count)!) as String
            icons.append(IconObject(icon: icon, name: name))
        } while SLDSIconActionType.init(rawValue: icons.count)?.hashValue != 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 48, height: 48)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        self.addIcons()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        
        let icon = icons[indexPath.item].icon
        
    
        let iconContainer = UIImageView(image: icon)
        cell.addSubview(iconContainer)
        
        return cell
    }
}
