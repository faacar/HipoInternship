//
//  DataLoader.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 28.03.2021.
//

import Foundation

final public class DataLoader {
    
    init() {
        loadData()
    }
    
    @Published var hipoModel: HipoModel!
    
    func loadData() {
        if let dataLocation = Bundle.main.url(forResource: "hipo", withExtension: "json") {
            do {
                //let jsonData = try String(contentsOfFile: dataLocation).data(using: .utf8)
                let jsonData = try Data(contentsOf: dataLocation)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(HipoModel.self, from: jsonData)
                
                self.hipoModel = decodedData
            } catch {
                    
            }
        }
    }
    
}
