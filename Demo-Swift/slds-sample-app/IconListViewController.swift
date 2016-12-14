/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
