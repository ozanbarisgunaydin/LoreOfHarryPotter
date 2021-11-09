//
//  HarryPotterViewModel.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 5.11.2021.
//

import Foundation

protocol IHarryPotterViewModel {
    func fetchItems()
    func changeLoading()
    
    var harryPotterCharacters: [WelcomeElement] { get set }
    var harryPotterService: IHarryPotterService { get }
    
    var harryPotterOutput: HarryPotterOutput? { get }
    var detailHarryPotterOutput: DetailHarryPotterOutput? { get }
    
    func setDelegate(output: HarryPotterOutput)
    func setDetailDelegate(output: DetailHarryPotterOutput)
}

final class HarryPotterViewModel: IHarryPotterViewModel {
    
    var harryPotterOutput: HarryPotterOutput?
    var detailHarryPotterOutput: DetailHarryPotterOutput?
    
    func setDetailDelegate(output: DetailHarryPotterOutput) {
        self.detailHarryPotterOutput = output
    }
    
    func setDelegate(output: HarryPotterOutput) {
        self.harryPotterOutput = output
    }
    
    var harryPotterCharacters: [WelcomeElement] = []
    private var isLoading = false
    let harryPotterService: IHarryPotterService
    
    init() {
        harryPotterService = HarryPotterService()
    }
    
    func fetchItems() {
        changeLoading()
        harryPotterService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.harryPotterCharacters = response ?? []
            self?.harryPotterOutput?.saveDatas(values: self?.harryPotterCharacters ?? [])
            self?.detailHarryPotterOutput?.saveDatas(values: self?.harryPotterCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        harryPotterOutput?.changeLoading(isLoad: isLoading)
    }
    
}
