//
//  MovieViewController.swift
//  BlurhashPOC
//
//  Created by marilyn A on 7/1/21.
//

import UIKit

class MovieViewController : UIViewController {
    
    var viewModel : MovieViewModel?{
        didSet{
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieViewController: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel?.selectMovie(at: indexPath.item)
  }
}
