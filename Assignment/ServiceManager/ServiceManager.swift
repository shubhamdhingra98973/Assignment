//
//  ServiceManager.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/24/20.
//

import Foundation

typealias APIHandler = (_ itemArr : [Item]? , _ error : String?) -> ()
class ServiceManager : NSObject {
    
    static var shared = ServiceManager()
    
    override init() {
        super.init()
    }
    
    func getItemsList(completion : @escaping APIHandler)  {
        
        guard let url = URL(string: AppUrls.Items.url) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            if error != nil {
                completion(nil , error?.localizedDescription)
            }
            else {
                do {
                    if let getData = data {
                    let itemArr = try JSONDecoder().decode([Item].self, from: getData)
                    completion(itemArr , nil)
                    }
                }
                catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

