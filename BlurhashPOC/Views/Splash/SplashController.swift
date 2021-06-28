//
//  SplashController.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//

import UIKit
import SnapKit

class SplashController: UIViewController {
    
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImageView)
        view.backgroundColor = .black;
        view.frame = UIScreen.main.bounds
        setupLogo()
    }
    
    func setupLogo(){
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
