//
//  SelfSizingCollectionViewCell.swift
//  SelfSizingHorizontalScroll
//
//  Created by Maheen Khalid on 2021-04-12.
//

import UIKit

class SelfSizingCollectionViewCell: UICollectionViewCell {
  
  let estimatedCellWidth = 100.0
  var labelText: String? {
    didSet{
      label.textColor = .darkGray
      label.text = labelText
    }
  }
  
  let label: UILabel = .init()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    setupContentView()
    setupLabel()
    
  }
  
  private func setupContentView() {
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([contentView.leftAnchor.constraint(equalTo: leftAnchor), contentView.rightAnchor.constraint(equalTo: rightAnchor), contentView.topAnchor.constraint(equalTo: topAnchor), contentView.bottomAnchor.constraint(equalTo: bottomAnchor)])
  }
  
  private func setupLabel() {
    contentView.addSubview(label)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5.0),
                                 label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5.0),
                                 label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
                                 label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5.0)])
  }
}
