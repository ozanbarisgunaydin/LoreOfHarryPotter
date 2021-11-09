//
//  DetailViewController.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 8.11.2021.
//

import UIKit
import SnapKit
import AlamofireImage

protocol DetailHarryPotterOutput {
    func saveDatas(values: [WelcomeElement])
}

final class DetailViewController: UIViewController {
    
    private let nameLabel: UILabel = UILabel()
    private let nameView: UIView = UIView()
    private let houseLabel: UILabel = UILabel()
    private let houseView: UIView = UIView()
    private let birthLabel: UILabel = UILabel()
    private let birthView: UIView = UIView()
    private let patronusLabel: UILabel = UILabel()
    private let patronusView: UIView = UIView()
    private let actorLabel: UILabel = UILabel()
    private let actorView: UIView = UIView()
    private let eyeLabel: UILabel = UILabel()
    private let eyeView: UIView = UIView()
    private let hairLabel: UILabel = UILabel()
    private let hairView: UIView = UIView()
    
    private let imageView: UIImageView = UIImageView()
    
    private lazy var result: [WelcomeElement] = []
    lazy var viewModel: IHarryPotterViewModel = HarryPotterViewModel()
    
    private lazy var  randomImageURL: String = "https://picsum.photos/200/300"

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDetailDelegate(output: self)
        viewModel.fetchItems()
    }
    
    private func configure() {
        DispatchQueue.main.async {
            self.view.backgroundColor = UIColor(named: "backgroundColor")
            
            self.view.addSubview(self.nameLabel)
            self.view.addSubview(self.nameView)
            self.view.bringSubviewToFront(self.nameLabel)
            
            self.view.addSubview(self.houseLabel)
            self.view.addSubview(self.houseView)
            self.view.bringSubviewToFront(self.houseLabel)
            
            self.view.addSubview(self.patronusLabel)
            self.view.addSubview(self.patronusView)
            self.view.bringSubviewToFront(self.patronusLabel)
            
            self.view.addSubview(self.birthLabel)
            self.view.addSubview(self.birthView)
            self.view.bringSubviewToFront(self.birthLabel)
            
            self.view.addSubview(self.imageView)
            
            self.view.addSubview(self.actorLabel)
            self.view.addSubview(self.actorView)
            self.view.bringSubviewToFront(self.actorLabel)
            
            self.view.addSubview(self.eyeLabel)
            self.view.addSubview(self.eyeView)
            self.view.bringSubviewToFront(self.eyeLabel)
            
            self.view.addSubview(self.hairLabel)
            self.view.addSubview(self.hairView)
            self.view.bringSubviewToFront(self.hairLabel)
            self.makeLabels()
        }
    }
}

extension DetailViewController {
    
    private func makeLabels() {
        
        let heightForLabels = (view.safeAreaLayoutGuide.layoutFrame.size.height - 264) / 8
        
        nameLabel.applyLabelDesign()
        nameView.applyViewDesign()
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(heightForLabels)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel)
            make.left.right.equalTo(nameLabel)
            make.height.equalTo(nameLabel)
        }
        
        houseLabel.applyLabelDesign()
        houseView.applyViewDesign()
        
        houseLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(heightForLabels)
        }
        
        houseView.snp.makeConstraints { make in
            make.top.equalTo(houseLabel)
            make.left.right.equalTo(houseLabel)
            make.height.equalTo(houseLabel)
        }
        
        patronusLabel.applyLabelDesign()
        patronusView.applyViewDesign()
        
        patronusLabel.snp.makeConstraints { make in
            make.top.equalTo(houseLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(heightForLabels)
        }
        
        patronusView.snp.makeConstraints { make in
            make.top.equalTo(patronusLabel)
            make.left.right.equalTo(patronusLabel)
            make.height.equalTo(patronusLabel)
        }
        
        birthLabel.applyLabelDesign()
        birthView.applyViewDesign()
        
        birthLabel.snp.makeConstraints { make in
            make.top.equalTo(patronusLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(heightForLabels)
        }
        
        birthView.snp.makeConstraints { make in
            make.top.equalTo(birthLabel)
            make.left.right.equalTo(birthLabel)
            make.height.equalTo(birthLabel)
        }
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.sizeToFit()
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(birthLabel.snp_bottomMargin).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(244)
            make.width.equalTo(170)
        }
        
        actorLabel.applyLabelDesign()
        actorView.applyViewDesign()
        
        actorLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_bottomMargin).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(heightForLabels)
        }
        
        actorView.snp.makeConstraints { make in
            make.top.equalTo(actorLabel)
            make.left.right.equalTo(actorLabel)
            make.height.equalTo(actorLabel)
        }
        
        eyeLabel.applyLabelDesign()
        eyeView.applyViewDesign()
        
        eyeLabel.snp.makeConstraints { make in
            make.top.equalTo(actorLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(heightForLabels)
        }
        
        eyeView.snp.makeConstraints { make in
            make.top.equalTo(eyeLabel)
            make.left.right.equalTo(eyeLabel)
            make.height.equalTo(eyeLabel)
        }
        
        hairLabel.applyLabelDesign()
        hairView.applyViewDesign()
        
        hairLabel.snp.makeConstraints { make in
            make.top.equalTo(eyeLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(heightForLabels)
        }
        
        hairView.snp.makeConstraints { make in
            make.top.equalTo(hairLabel)
            make.left.right.equalTo(hairLabel)
            make.height.equalTo(hairLabel)
        }
    }
    
    func getModel(model: WelcomeElement) {
        
        self.navigationItem.title = model.name
        
        nameLabel.text = "✪ \(model.name ?? "None") ✪"
        houseLabel.text = "🏰 \(String(describing: model.house!).firstCapitalized) House 🏰"
        patronusLabel.text = "🪄 Patronus: \(String(describing: model.patronus!).firstCapitalized) 🪄"
        birthLabel.text = "👼🏻 Birthday: \(String(describing: model.dateOfBirth!.rawValue)) 👼🏻"
        imageView.af.setImage(withURL: (URL(string: model.image ?? randomImageURL) ?? URL(string: randomImageURL)!))
        actorLabel.text = "🎬 Actor: \(String(describing: model.actor!).firstCapitalized) 🎬"
        eyeLabel.text = "👁 Eye: \(String(describing: model.eyeColour!).firstCapitalized) 👁"
        hairLabel.text = "💇🏼‍♀️ Hair: \(String(describing: model.hairColour!).firstCapitalized) 💇🏼"
    }
}

extension DetailViewController: DetailHarryPotterOutput {
    func saveDatas(values: [WelcomeElement]) { result = values }
}
