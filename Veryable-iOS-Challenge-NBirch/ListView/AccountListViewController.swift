//
//  AccountListViewController.swift
//  Veryable-iOS-Challenge-NBirch
//
//  Created by Birch, Nathan J on 7/7/21.
//

import UIKit

private var selectedAccount: Account?

class AccountListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var collectionView: UICollectionView!
    var accounts: [Account] = []
    let layout = UICollectionViewFlowLayout()
    
    // makes it so that we dont' have to retype this string a lot (minimizes spelling errors)
    struct Cells {
        static let accountCell = "AccountCell"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Accounts".uppercased()
        view.backgroundColor = ViewColor.background.color
        configureFlowLayout()
        configureCollectionView()
        getAccounts()
    }


    // customizing nav bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backButtonTitle = ""
    }
    
    
    // setup for collection view cell size and spacing
    func configureFlowLayout() {
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: view.bounds.width-40, height: 90)
        layout.minimumLineSpacing = 15;
    }
    
    
    // setup for collection view, where to look for data, type of cells, etc.
    func configureCollectionView() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView ?? UICollectionView())
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(AccountCell.self, forCellWithReuseIdentifier: Cells.accountCell)
        collectionView?.backgroundColor = .clear
    }

    
    // fetching and loading data on success, handling errors on failiure
    func getAccounts() {
        showLoadingView()
        NetworkManager.shared.getAccounts() { [weak self] (result) in
            // instead of making all self calls below optionals, we unwrap self here to ensure it has a value (makes for cleaner code)
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            // if we succeed in our network call...
            case .success(let accounts):
                print("success")
                self.accounts = accounts
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            // if we fail in our network call...
            case .failure(let error):
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    // adding visual effects to each cell
    func configureCell(_ cell: UICollectionViewCell) {
        cell.backgroundColor = .white
        cell.contentView.layer.cornerRadius = 3.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
    
    
    // handles tap gesture
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            selectedAccount = accounts[indexPath.row]
            navigationController?.pushViewController(AccountDetailViewController(account: selectedAccount!), animated: true)
        }
    
    
    // handles size of collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accounts.count
    }
    
    
    // configures cells and injects with account data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.accountCell, for: indexPath) as! AccountCell
        configureCell(cell)
        let account = accounts[indexPath.row]
        cell.set(account: account)
        return cell
    }
}
