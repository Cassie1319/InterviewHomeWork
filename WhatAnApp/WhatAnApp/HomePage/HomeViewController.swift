//
//  HomeViewController.swift
//  WhatAnApp
//
//  Created by Cassie on 2024/10/15.
//

import UIKit

class HomeViewController: UIViewController {

    private let collectionCellNibName = "CustomCollectionViewCell"
    private let numberOfColumns = 2
    private var cellModels = [CellModel]()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: collectionCellNibName, bundle: nil), forCellWithReuseIdentifier: collectionCellNibName)
        }
    }
    
    private lazy var searchController: UISearchController = {
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchBar.placeholder = "Search".localized
        searchVC.searchBar.delegate = self
        searchVC.searchBar.backgroundColor = UIColor.red
        //.systemGray6
        return searchVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCellModels()
        if let naviController = navigationController {
            naviController.navigationItem.searchController = searchController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        //navigationController?.navigationBar.topItem?.hidesBackButton = true
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellNibName, for: indexPath) as! CustomCollectionViewCell
        collectionViewCell.cellModel = cellModels[indexPath.row]
        collectionViewCell.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        collectionViewCell.layer.borderWidth = 1
        return collectionViewCell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ( collectionView.frame.size.width - 20.0 ) / CGFloat(numberOfColumns)
        let height = collectionView.frame.size.height / 3.0
        return CGSize(width: width, height: height)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        refreshData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        refreshData()
    }
    
}

private extension HomeViewController {
    
    func createCellModels() {
        for i in 1...10 {
            let cellModel = CellModel()
            let imageName = "image" + "\(i)"
            cellModel.imageName = imageName
            cellModels.append(cellModel)
        }
    }
}
