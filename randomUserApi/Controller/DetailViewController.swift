//
//  DetailViewController.swift
//  randomUserApi
//
//  Created by Döbrönte Réka on 2020. 03. 03..
//  Copyright © 2020. dobrontereka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabelTitle: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabelTitle: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabelTitle: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var contactLabelTitle: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var imageOfUser: UIImageView!
    
    var data: Displayable?
    var userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    private func commonInit() {
        guard let data = data else { return }
        
        let fullName = userManager.getFullName(name: data.nameLabel.value)
        let image = userManager.getImage(picture: data.imageView.large, round: false)
        let fullLocation = userManager.getFullLocation(location: data.locationLabel.value)
        
        imageOfUser.image = image
        
        nameLabelTitle.text = data.nameLabel.label
        nameLabel.text = fullName
        
        genderLabelTitle.text = data.genderLabel.label
        genderLabel.text = data.genderLabel.value
        
        locationLabelTitle.text = data.locationLabel.label
        locationLabel.text = fullLocation
        
        contactLabelTitle.text = data.contactLabel.label
        contactLabel.text = data.contactLabel.value
    }
}
