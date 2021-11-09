//
//  HarryPotterTableViewCell.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 5.11.2021.
//

import UIKit
import AlamofireImage

class HarryPotterTableViewCell: UITableViewCell {
    
    private let portreImage: UIImageView = UIImageView()
    let nameTitle: UILabel = UILabel()
    private let actorTitle: UILabel = UILabel()
    
    private lazy var  randomImageURL: String = "https://picsum.photos/200/300"
    
    enum Identifier: String {
        case costum = "OZan"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(portreImage)
        addSubview(nameTitle)
        addSubview(actorTitle)
        

        portreImage.layer.cornerRadius = 5
        portreImage.layer.masksToBounds = true
        portreImage.sizeToFit()

        
        nameTitle.font = .boldSystemFont(ofSize: 20)
        nameTitle.textColor = .orange
        nameTitle.numberOfLines = 0
        
        actorTitle.font = .italicSystemFont(ofSize: 14)
        actorTitle.textColor = .white

        portreImage.snp.makeConstraints { make in
            make.height.equalTo(341 / 2 )
            make.width.equalTo(237 / 2 )
            make.top.equalTo(contentView).offset(20)
            make.right.equalTo(-10)
        }
        
        nameTitle.snp.makeConstraints { make in
            make.top.equalTo(portreImage.snp.top).offset((341 / 3) - 60 )
            make.width.equalTo(contentView.frame.width - (237 / 2))

        }
        
        actorTitle.snp.makeConstraints { make in
            make.top.equalTo(nameTitle).offset(40)
            make.left.right.equalTo(nameTitle)
        }
    }
    
    func saveModel(model: WelcomeElement) {
        nameTitle.text = model.name
        actorTitle.text = "Actor: \(model.actor ?? "")"
        portreImage.af.setImage(withURL: (URL(string: model.image ?? randomImageURL) ?? URL(string: randomImageURL)!))

    }
    
}
