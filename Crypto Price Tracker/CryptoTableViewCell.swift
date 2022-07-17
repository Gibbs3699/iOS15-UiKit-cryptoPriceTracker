//
//  CryptoTableViewCell.swift
//  Crypto Price Tracker
//
//  Created by TheGIZzz on 13/7/2565 BE.
//

import UIKit
import AlamofireImage

struct CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let iconURL: URL?
}


class CryptoTableViewCell: UITableViewCell {

    static let identifier = "CryptoTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .green
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(iconImage)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImage.image = nil
        nameLabel.text = nil
        symbolLabel.text = nil
        priceLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.sizeToFit()
        symbolLabel.sizeToFit()
        priceLabel.sizeToFit()
        
        let size: CGFloat = contentView.frame.size.height/1.1
        
        iconImage.frame = CGRect(x: 20, y: (contentView.frame.size.height-size)/2, width: size, height: size)
        
        nameLabel.frame = CGRect(x: 30 + size, y: 0, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        
        symbolLabel.frame = CGRect(x: 30 + size, y: contentView.frame.size.height/2 , width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        
        priceLabel.frame = CGRect(x: contentView.frame.size.width/2, y: 0, width: contentView.frame.size.width/2-20, height: contentView.frame.size.height)
        
    }
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        
        guard let url = viewModel.iconURL else {
            return
        }
        
        DispatchQueue.main.async {
            self.iconImage.af.setImage(withURL: url)
        }
    }

}
