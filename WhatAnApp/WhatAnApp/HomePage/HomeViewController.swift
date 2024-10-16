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
    private var currentCellModels = [CellModel]()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: collectionCellNibName, bundle: nil), forCellWithReuseIdentifier: collectionCellNibName)
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.placeholder = "Search".localized
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCellModels()
        currentCellModels.append(contentsOf: cellModels)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentCellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellNibName, for: indexPath) as! CustomCollectionViewCell
        collectionViewCell.cellModel = currentCellModels[indexPath.row]
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
        if let keyword = searchBar.text {
            currentCellModels.removeAll()
            if !keyword.isEmpty {
                for cellModel in cellModels {
                    if cellModel.imageName.contains(keyword) {
                        currentCellModels.append(cellModel)
                    }
                }
            } else {
                currentCellModels.append(contentsOf: cellModels)
            }
            collectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentCellModels.removeAll()
        currentCellModels.append(contentsOf: cellModels)
        collectionView.reloadData()
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
