//
//  UsersTableViewCell.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit
import SDWebImage
import SkeletonView
class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usersImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        usersImage.showAnimatedGradientSkeleton()
        userName.showAnimatedGradientSkeleton()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(user:UserElement)  {
        hideAnimation()
        print("cell\(user)")
        userName.text = user.login
        usersImage.sd_setImage(with: URL(string: user.avatarURL ?? ""))
    }
    
    func hideAnimation()  {
        userName.hideSkeleton()
        usersImage.hideSkeleton()
    }
    
}
