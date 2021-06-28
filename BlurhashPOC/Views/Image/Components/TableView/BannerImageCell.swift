//
//  BannerImageCell.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//

import UIKit

class BannerImageCell: UITableViewCell {
    
    var data : ImageViewModel?{
        didSet{
            setupImage()
        }
    }
    
    let favorite : UIButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "heart"), for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
      button.layer.cornerRadius = 0.5 * button.bounds.size.width
      button.clipsToBounds = true
      button.backgroundColor = .white
      button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
      button.layer.shadowOffset = CGSize(width: 0, height: 3)
      button.layer.shadowOpacity = 1.0
      button.layer.shadowRadius = 10.0
      button.layer.masksToBounds = false
      return button;
    }()
       
   // var videoPlayerView = VideoPlayerView()
   
    
    var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Hannah Montana"
        label.numberOfLines = 0;
        label.textColor = .black
        label.sizeToFit()
        label.font =  UIFont(name: "BalsamiqSans-Bold", size: 25)
        return label
    }()
    
   
    var mainImage : UIImageView = {
        
        let imageView = UIImageView(image:UIImage(named: "Aquaman"))
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        imageView.autoresizesSubviews = true
        imageView.sizeToFit()
        imageView.contentMode = .scaleAspectFill // OR .scaleAspectFill
    
        return imageView;
    }()
   
  
    let thumbnailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "Raazi")
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        imageView.autoresizesSubviews = true
        imageView.sizeToFit()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
  
  
    let view = UIView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = .mainColor;

        setupLayout()
    }
  
    func setupImage(){
        guard let images = data else {return}
        self.thumbnailImageView.image = images.image?.image
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.thumbnailImageView.loadImageUsingUrlString(urlString: images.imageUrl)
        }
       
    }
    
    func setupLayout(){
        
    
        self.addSubview(nameLabel)
        self.addSubview(view)
        self.view.addSubview(thumbnailImageView)
        self.view.bringSubviewToFront(thumbnailImageView)

        //view.backgroundColor = UIColor.red
         
        view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        thumbnailImageView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.height.width.equalToSuperview()
        }
        
 
    }
  
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
