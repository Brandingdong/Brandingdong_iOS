//
//  CategoryViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  // MARK: - Property
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()

  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
    setUI()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
  
  struct Standard {
    static let standard : CGFloat = 0
    static let inset = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
  }
  
  // MARK: - Setup Layout
  private func setNavi() {
    navigationController?.navigationBar.isHidden = false
    navigationItem.title = "카테고리"
  }
  
  private func setUI() {
    collectionView.backgroundColor = .systemBackground
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(CategoryViewCustomCell.self, forCellWithReuseIdentifier: CategoryViewCustomCell.identifier)
    collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
    view.addSubview(collectionView)
  }
}
//MARK: - UICollectionViewDataSource
extension CategoryViewController : UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 || section == 1 {
      return 12
    } else {
      return 9
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCustomCell.identifier, for: indexPath) as! CategoryViewCustomCell
    cell.layer.borderWidth = 0.5
    cell.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
    
    if indexPath.section == 0 {
      cell.configure(data: byoungilData.marketData[indexPath.row])
    } else if indexPath.section == 1 {
      cell.configure(data: byoungilData.brandData[indexPath.row])
    } else {
      cell.configure(data: byoungilData.beautyData[indexPath.row])
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
    if indexPath.section == 0 {
       header.configure(image: "market", title: "쇼핑몰.마켓")
    } else if indexPath.section == 1 {
       header.configure(image: "brand", title: "브랜드")
    } else {
      header.configure(image: "beauty", title: "뷰티")
    }
    return header
    } else {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
      if indexPath.section == 0 || indexPath.section == 1 {
        footer.configure(withColor: .lightGray)
      } else {
        footer.configure(withColor: .white)
      }
      return footer
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 60)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    if section == 0 || section == 1 {
      return CGSize(width: view.frame.width, height: 5)
    } else {
      return CGSize(width: view.frame.width, height: 50)
    }
    
  }
}
//MARK: - UICollectionViewDelegate
extension CategoryViewController : UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.row == 1 {
      let controller = OuterViewController()
      controller.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(controller, animated: true)
    }
  }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CategoryViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = view.frame.size.width - (Standard.standard * 2)
    let realWidth = width / 3
    return CGSize(width: realWidth, height: 50)
  }
}
