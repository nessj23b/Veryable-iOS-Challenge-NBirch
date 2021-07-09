//
//  AccountCell.swift
//  Veryable-iOS-Challenge-NBirch
//
//  Created by Birch, Nathan J on 7/7/21.
//

import UIKit

// for formatting the custom cell layouts
class AccountCell: UICollectionViewCell {
    
    // data displayed
    var accountName = UILabel()
    var desc = UILabel()
    var accountType = UILabel()
    var accountImage = UIImageView()
    var arrowImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAccountName()
        configureDescription()
        configureAccountType()
        configureArrowImage()
        
        setAccountImageConstraints()
        setAccountNameConstraints()
        setDescriptionConstraints()
        setAccountTypeConstraints()
        setArrowImageConstraints()
    }

    // storyboard init
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    

    // assigning values to variables
    func set(account: Account) {
        accountName.text = account.accountName
        desc.text = account.desc
        accountType.text = formatType(accountType: account.accountType)
        accountImage.image = setImage(accountType: accountType)
    }
    
    
    
    // ***** FORMATTING *****
    func setImage(accountType: UILabel) -> UIImage {
        return accountType.text == "Bank Account: ACH - Same Day" ? UIImage(named: "bank")! : UIImage(named: "card")!
    }
    
    
    func formatType(accountType: String) -> String {
        return accountType == "bank" ? "Bank Account: ACH - Same Day" : "Card: Instant"
    }
    
    
    
    // ***** STYLING *****
    func configureAccountName() {
        addSubview(accountName)
        accountName.numberOfLines = 1
        accountName.adjustsFontSizeToFitWidth = true
        accountName.textColor = VGrey.dark.color
        accountName.font = .vryAvenirNextDemiBold(14)
    }
    
    
    func configureDescription() {
        addSubview(desc)
        desc.numberOfLines = 1
        desc.adjustsFontSizeToFitWidth = false
        desc.textColor = VGrey.dark.color
        desc.font = .vryAvenirNextRegular(12)
    }
    
    
    func configureAccountType() {
        addSubview(accountType)
        accountType.numberOfLines = 1
        accountType.adjustsFontSizeToFitWidth = false
        accountType.textColor = VGrey.normal.color
        accountType.font = .vryAvenirNextRegular(12)
    }
    
    
    func configureArrowImage() {
        arrowImageView = UIImageView(image: UIImage(named: "arrow"))
        addSubview(arrowImageView)
    }
    
    
    
    // ***** LAYOUT *****
    func setAccountImageConstraints() {
        contentView.addSubview(accountImage)
        accountImage.translatesAutoresizingMaskIntoConstraints = false
        accountImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20).isActive = true
        accountImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        accountImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        accountImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    func setAccountNameConstraints() {
        accountName.translatesAutoresizingMaskIntoConstraints = false
        accountName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20).isActive = true
        accountName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        accountName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        accountName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
    func setDescriptionConstraints() {
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.centerYAnchor.constraint(equalTo: accountName.bottomAnchor, constant: 12).isActive = true
        desc.leadingAnchor.constraint(equalTo: accountName.leadingAnchor).isActive = true
        desc.heightAnchor.constraint(equalToConstant: 15).isActive = true
        desc.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
    func setAccountTypeConstraints() {
        accountType.translatesAutoresizingMaskIntoConstraints = false
        accountType.centerYAnchor.constraint(equalTo: desc.bottomAnchor, constant: 12).isActive = true
        accountType.leadingAnchor.constraint(equalTo: accountName.leadingAnchor).isActive = true
        accountType.heightAnchor.constraint(equalToConstant: 15).isActive = true
        accountType.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
    func setArrowImageConstraints() {
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
}

