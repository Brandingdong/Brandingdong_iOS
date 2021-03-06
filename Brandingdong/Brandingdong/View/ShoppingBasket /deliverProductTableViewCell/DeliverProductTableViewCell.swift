//
//  deliverProductTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DeliverProductTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "DeliverProductTableViewCell"
  
  private let tableView = UITableView()
  let fomatter = NumberFormatter()
  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
    setTableView()
    priceFommater()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    contentView.addSubview(tableView)
  }
  
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    tableView.dataSource = self
    tableView.allowsSelection = false
    
    tableView.register(DeliverProductTitleTableViewCell.self,
                       forCellReuseIdentifier: DeliverProductTitleTableViewCell.identifier)
    
    tableView.register(DeliverProductInfoListTableViewCell.self,
                       forCellReuseIdentifier: DeliverProductInfoListTableViewCell.identifier)
    
    tableView.register(DeliverProductBannerTableViewCell.self,
                       forCellReuseIdentifier: DeliverProductBannerTableViewCell.identifier)
    
    tableView.register(DeliverProductPaymentTitleTableViewCell.self,
                       forCellReuseIdentifier: DeliverProductPaymentTitleTableViewCell.identifier)
    
    tableView.register(DeliverProductPayMentInfoTableViewCell.self,
                       forCellReuseIdentifier: DeliverProductPayMentInfoTableViewCell.identifier)
  }
  
  // MARK: - PriceFommater
  
  private func priceFommater() {
    fomatter.numberStyle = .decimal
    fomatter.minimumFractionDigits = 0
    fomatter.maximumFractionDigits = 3
  }
  
}

// MARK: - UITableViewDataSource

extension DeliverProductTableViewCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let titleHeight: CGFloat = 72
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliverProductTitleTableViewCell.identifier,
                                               for: indexPath) as! DeliverProductTitleTableViewCell
      tableView.rowHeight = titleHeight
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliverProductInfoListTableViewCell.identifier,
                                               for: indexPath) as! DeliverProductInfoListTableViewCell
      tableView.rowHeight = 242
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliverProductBannerTableViewCell.identifier,
                                               for: indexPath) as! DeliverProductBannerTableViewCell
      tableView.rowHeight = titleHeight
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliverProductPaymentTitleTableViewCell.identifier,
                                               for: indexPath) as! DeliverProductPaymentTitleTableViewCell
      tableView.rowHeight = titleHeight
      return cell
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliverProductPayMentInfoTableViewCell.identifier,
                                               for: indexPath) as! DeliverProductPayMentInfoTableViewCell
      cell.configure(price: fomatter.string(from: ProductInfo.checkProductPrice as NSNumber)! + " 원",
                     resultPrice: fomatter.string(from: ProductInfo.checkProductPrice as NSNumber)! + " 원")
      tableView.rowHeight = 172
      return cell
    default:
      break
    }
    return UITableViewCell()
  }
}
