//
//  ImageViewCell.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//

import UIKit

class ImageViewCell : UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var collectionView: UICollectionView!
    var data = [String]()
    var images = [UIImage]()
    var blurArray = [String]()
    var colors = [String]()
    var blurHash: String = ""
    var xComponents: Int = 4
    var yComponents: Int = 3
    var punch: Float = 1
    var imageArray = [UIImage]()
    
    let subLabel : UILabel = {
        let label = UILabel()
        label.text = "Trainers for you"
        label.textColor = UIColor.black
        label.numberOfLines = 0;
        label.textAlignment = .left
        label.font = UIFont(name: "BalsamiqSans-Regular", size: 20)
        return label
    }()
    
    let startLabel : UILabel = {
       let label = UILabel()
       label.text = "View All"
       label.textColor = UIColor.black
       label.numberOfLines = 0;
       label.textAlignment = .left
       label.font = UIFont(name: "BalsamiqSans-Regular", size: 20)
       return label
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
      
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(IndividualImageCell.self, forCellWithReuseIdentifier: "individualImageCell")
        collectionView.backgroundColor = .mainColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
//        self.addSubview(subLabel)
        self.addSubview(collectionView)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
       
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.99)
            make.height.equalToSuperview()
        }
   
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        let cellsperrow : CGFloat = 4

        return CGSize(width: collectionViewSize/cellsperrow, height: collectionView.frame.size.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: IndividualImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "individualImageCell", for: indexPath) as! IndividualImageCell
        
        cell.image.image =  UIImage(blurHash: blurArray[indexPath.row], size: CGSize(width: 32, height: 32), punch: punch)
       
        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
            cell.image.image = self.imageArray[indexPath.row]
        }
        cell.layer.cornerRadius = 1;
       
        return cell
    }

    
}


