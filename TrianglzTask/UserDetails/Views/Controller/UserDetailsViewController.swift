//
//  UserDetailsViewController.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage
class UserDetailsViewController: UIViewController,Storyboarded {
    
    private var disposeBag = DisposeBag()
    var userDetailsViewModel:UserDetailsViewModel?
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        userDetailsViewModel?
            .userNameBehaviorSubject
            .bind(to: userName.rx.text)
            .disposed(by: disposeBag)
        
        userDetailsViewModel?
            .userImageBehaviorSubject
            .subscribe(onNext: { [weak self] (image) in
                guard let self = self else {return}
                self.userImage.sd_setImage(with: URL(string: image))
            }).disposed(by: disposeBag)
        
        
    }
    
    
}
