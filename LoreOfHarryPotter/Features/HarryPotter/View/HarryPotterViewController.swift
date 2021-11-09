//
//  HarryPotterViewController.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 5.11.2021.
//

import UIKit
import SnapKit

protocol HarryPotterOutput {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [WelcomeElement])
}

final class HarryPotterViewController: UIViewController {
    
    private let labelTitle : UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var result: [WelcomeElement] = []
    
    lazy var viewModel: IHarryPotterViewModel = HarryPotterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
    }
    
    private func configure() {
        
        view.addSubview(tableView)
        view.addSubview(indicator)
        
        drawDesing()
        makeTable()
        makeIndicator()
    }
    
    private func drawDesing() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HarryPotterTableViewCell.self, forCellReuseIdentifier: HarryPotterTableViewCell.Identifier.costum.rawValue)
        tableView.rowHeight = (341 / 2) + 40
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        tableView.tintColor = UIColor(named: "backgroundColor")
        tableView.separatorColor = .white
        
        DispatchQueue.main.async {
            self.view.backgroundColor = UIColor(named: "backgroundColor")
            self.navigationItem.title = "Characters"
            self.navigationController?.navigationBar.barTintColor = UIColor.black
            self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.orange]
            self.indicator.color = .blue
            self.indicator.startAnimating()
        }
    }
}

extension HarryPotterViewController: HarryPotterOutput {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [WelcomeElement]) {
        result = values
        tableView.reloadData()
    }
}

extension HarryPotterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : HarryPotterTableViewCell = tableView.dequeueReusableCell(withIdentifier: HarryPotterTableViewCell.Identifier.costum.rawValue) as? HarryPotterTableViewCell else {
            return UITableViewCell()
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black
        cell.selectedBackgroundView = backgroundView

        cell.backgroundColor = UIColor(named: "backgroundColor")
        cell.tintColor = .black
        cell.saveModel(model: result[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.getModel(model: result[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HarryPotterViewController {
    
    private func makeTable() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)

        }
    }
    
    private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview()
        }
    }
}
