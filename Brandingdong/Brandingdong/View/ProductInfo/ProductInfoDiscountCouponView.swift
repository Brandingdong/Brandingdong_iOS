//
//  DiscountCouponView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoDiscountCouponView: UIView {
  // MARK: - Property
  
  let discountCouponButton: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.setTitle("할인 쿠폰 받기", for: .normal)
    btn.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-regular", size: 16)
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 15
    return btn
  }()
  
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    self.addSubview(discountCouponButton)
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    
    discountCouponButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
      $0.leading.equalToSuperview().offset(padding)
      $0.bottom.equalToSuperview().offset(-padding)
      $0.trailing.equalToSuperview().offset(-padding)
    }
  }
}
