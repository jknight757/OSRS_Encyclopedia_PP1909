//
//  itemRequest.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/11/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import Foundation

enum ItemError:Error{
    case noDataAvailable
    case canNotProcessData
}
struct request{
    let resourceURL: URL
    
    init(fileName: String){
        let resourceString = "https://www.osrsbox.com/osrsbox-db/\(fileName)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getItems(completion: @escaping(Result<[ItemDetail], ItemError>)-> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, _, _) in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let itemResponse = try decoder.decode(Response.self, from: jsonData)
                let itemDetails = itemResponse.response.items
                completion(.success(itemDetails))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}
