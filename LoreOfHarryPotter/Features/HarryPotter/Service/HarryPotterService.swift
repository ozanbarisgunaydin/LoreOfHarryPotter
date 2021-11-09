//
//  HarryPotterService.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 5.11.2021.
//

import Alamofire

enum HarryPotterServiceEndPoint: String {
    case BASE_URL = "http://hp-api.herokuapp.com/api"
    case PATH = "/characters"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IHarryPotterService {
    func fetchAllDatas(response: @escaping ([WelcomeElement]?) -> Void)
}

struct HarryPotterService: IHarryPotterService {
    
    func fetchAllDatas(response: @escaping ([WelcomeElement]?) -> Void) {
        AF.request(HarryPotterServiceEndPoint.characterPath()).responseDecodable(of: [WelcomeElement].self) { (model) in
            guard let data = model.value else {
//                Error
                response(nil)
                return
            }
            
            response(data)
            
        }
    }
    
}
