//
//  ViewController.swift
//  SelfSizingHorizontalScroll
//
//  Created by Maheen Khalid on 2021-04-12.
//

import UIKit

class ViewController: UIViewController {
  
  private var collectionView: UICollectionView!
  private let collectionViewFlowLayout: UICollectionViewFlowLayout = .init()
  
  private let buttonLabels = ["Liked songs Button", "Podcasts", "Albums", "Playlists", "Radio", "Browse"]

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    collectionViewFlowLayout.scrollDirection = .horizontal
    collectionViewFlowLayout.estimatedItemSize = CGSize(width: 100.0, height: 100.0)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    collectionView.dataSource = self
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .white
    collectionView.register(SelfSizingCollectionViewCell.self, forCellWithReuseIdentifier: "SelfSizingCell")
    view.addSubview(collectionView)
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([collectionView.leftAnchor.constraint(equalTo: view.leftAnchor), collectionView.rightAnchor.constraint(equalTo: view.rightAnchor), collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25.0), collectionView.heightAnchor.constraint(equalToConstant: 50.0)])
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    buttonLabels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelfSizingCell", for: indexPath) as! SelfSizingCollectionViewCell
    cell.labelText = buttonLabels[indexPath.item]
    return cell
  }
}

