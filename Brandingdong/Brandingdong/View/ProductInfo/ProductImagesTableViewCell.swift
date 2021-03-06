//
//  ProductImagesView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductImagesTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "ProductImagesTableViewCell"
  
  private let deviceWidth = UIScreen.main.bounds.width
  private let deviceHeight = UIScreen.main.bounds.height
  private let pageControl = UIPageControl()
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  var productImageArr: [UIImage] = ProductInfo.checkProductNameImageArr

  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setLayout()
    setCollectionView()
    setPageControl()
    setUI()
    setConstraints()
  }
  
  
  // MARK: - Set Property
  
  private func setLayout() {
    let itemHeight: CGFloat = 532
    let itemSpasing: CGFloat = 0
    let lineSpasing: CGFloat = 0
    let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    layout.scrollDirection = .horizontal
    layout.sectionInset = sectionInset
    layout.minimumLineSpacing = lineSpasing
    layout.minimumInteritemSpacing = itemSpasing
    layout.itemSize = CGSize(width: deviceWidth, height: itemHeight)
  }
  
  private func setCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(ProductInfoImageCollectionViewCell.self, forCellWithReuseIdentifier: ProductInfoImageCollectionViewCell.identifier)
  }
  
  // MARK: - setPageControl
  
  private func setPageControl() {
    pageControl.numberOfPages = productImageArr.count
    pageControl.pageIndicatorTintColor = .lightGray
    pageControl.currentPageIndicatorTintColor = .white
    pageControl.hidesForSinglePage = true
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [collectionView, pageControl].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let margin: CGFloat = 8
    
    collectionView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
    
    pageControl.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-margin)
    }
  }
}


// MARK: - UICollectionViewDataSource
extension ProductImagesTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    productImageArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductInfoImageCollectionViewCell.identifier, for: indexPath) as! ProductInfoImageCollectionViewCell
    
    cell.imageView.image = self.productImageArr[indexPath.item]
    
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension ProductImagesTableViewCell: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    pageControl.currentPage = page
  }
}




