//
//  IndividualImageCell.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//
import UIKit

class  IndividualImageCell: UICollectionViewCell {
    
    
    let outerCard = CardView()
    let imageCard = UIView()
    
    var textLabel : UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.numberOfLines = 0;
        label.textAlignment = .center
        label.textColor = .white
        label.sizeToFit()
        label.font =  UIFont(name: "BalsamiqSans-Bold", size: 20)
        return label
    }()
    
    let image : UIImageView = {
        
        let imageView = UIImageView(image:UIImage(named: "Aquaman"))
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        imageView.autoresizesSubviews = true
        imageView.sizeToFit()
        imageView.contentMode = .scaleAspectFill // OR .scaleAspectFill
    
        return imageView;
    }()
    
    let star : UIImageView = {
           let imageView = UIImageView(image: UIImage(named: "star"));
           imageView.translatesAutoresizingMaskIntoConstraints = false;
           imageView.contentMode = .center
           return imageView;
       }()
    
    let timeImage : UIImageView = {
           let imageView = UIImageView(image: UIImage(named: "time"));
           imageView.translatesAutoresizingMaskIntoConstraints = false;
           imageView.contentMode = .center
           return imageView;
       }()

    var starLabel : UILabel = {
           let label = UILabel()
           label.text = "4.9"
           label.numberOfLines = 0;
           label.textAlignment = .center
           label.textColor = .white
           label.sizeToFit()
           label.font =  UIFont(name: "BalsamiqSans-Bold", size: 18)
           return label
       }()
    
    var timeLabel : UILabel = {
        let label = UILabel()
        label.text = "45 sec"
        label.numberOfLines = 0;
        label.textAlignment = .center
        label.textColor = .white
        label.sizeToFit()
        label.font =  UIFont(name: "BalsamiqSans-Regular", size: 10)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        backgroundColor = .mainColor;
        self.imageCard.backgroundColor = .clear
        self.outerCard.backgroundColor = .clear
        addSubview(outerCard)
        self.outerCard.addSubview(image)
        setupLayout()
    
    }
    
    func setupLayout(){
        
        outerCard.snp.makeConstraints { (make) in
            make.height.width.equalToSuperview()
        }
        
        image.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }

    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
       image.frame = self.outerCard.bounds
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
  func resizeTopAlignedToFill(containerSize: CGSize) -> UIImage? {
    let scaleTarget = containerSize.height / containerSize.width
    let scaleOriginal = size.height / size.width

    if scaleOriginal <= scaleTarget { return self }

    let newHeight = size.width * scaleTarget
    let newSize = CGSize(width: size.width, height: newHeight)

    UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
    self.draw(in: CGRect(origin: .zero, size: newSize))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage
  }
}
