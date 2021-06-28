//
//  ImageViewController.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//

import Foundation
import SnapKit

class ImageViewController : UIViewController{
    
     let imageView : UIImageView = {
        
        let imageView = UIImageView(image:UIImage(named: "Raazi"))
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        imageView.autoresizesSubviews = true
        imageView.sizeToFit()
        imageView.contentMode = .scaleAspectFill // OR .scaleAspectFill
    
        return imageView;
    }()
    
    let blurImageView : UIImageView = {
       
       let imageView = UIImageView(image:UIImage(named: "Raazi"))
       imageView.layer.masksToBounds = false
       imageView.layer.cornerRadius = 20
       imageView.clipsToBounds = true
       imageView.isUserInteractionEnabled = false
       imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
       imageView.autoresizesSubviews = true
       imageView.sizeToFit()
       imageView.contentMode = .scaleAspectFill // OR .scaleAspectFill
   
       return imageView;
   }()
    
    weak var hashLabel:UILabel?
    weak var xComponentsLabel:UILabel?
    weak var yComponentsLabel:UILabel?
    
    var myTableView : UITableView!

    var data : ImageViewModel?{
        didSet{
            setupView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainColor
        self.title = "ZEE5"
        fetchContent()
    }
    
    func setupView(){
        DispatchQueue.main.async {
            self.myTableView = UITableView()
            self.myTableView.register(BannerImageCell.self, forCellReuseIdentifier: "bannerImageCell")
            self.myTableView.register(ImageViewCell.self, forCellReuseIdentifier: "imageViewCell")
            self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Empty")
            self.myTableView.dataSource = self
            self.myTableView.delegate = self
            self.myTableView.allowsSelection = false
            self.myTableView.backgroundColor = .mainColor
            self.myTableView.separatorStyle = .none
            self.view.addSubview(self.myTableView)
            self.setup()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       if indexPath.section == 0{
        return 250     }
       else if indexPath.section == 1{
         return 150
       }
         return 400
    }
    
     func fetchContent() {
        NetworkManager.shared.fetchImages{ [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.data = ImageViewModel(imageModel: articles)
            case .failure(let error):
                DispatchQueue.main.async { UIHelper.createAlertController(title: "Error", message: error.rawValue, in: self) }
            }
        }
    }
        
    func setup(){
           myTableView.snp.makeConstraints { (make) in
               make.leading.trailing.equalToSuperview()
               make.top.equalToSuperview()
               make.bottom.equalToSuperview()
               make.width.equalToSuperview()
           }
    }
}
