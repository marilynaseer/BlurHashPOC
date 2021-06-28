//
//  ImageViewController+Extension.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//

import UIKit

extension ImageViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "bannerImageCell", for: indexPath as IndexPath) as!  BannerImageCell
            cell.data = self.data
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageViewCell", for: indexPath as IndexPath) as!  ImageViewCell
            cell.contentView.isUserInteractionEnabled = false
            cell.imageArray = data?.imageArray ?? []
            cell.backgroundColor = .mainColor
            cell.blurArray = data?.blurArray ?? []
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Empty", for: indexPath as IndexPath)
        return cell

    }
}
