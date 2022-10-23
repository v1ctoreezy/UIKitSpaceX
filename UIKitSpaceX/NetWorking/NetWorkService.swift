//
//  NetWorkLayer.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 21.08.2022.
//
//
import Foundation

class NetWorkService {
    static let shared = NetWorkService()
    func getData<Type: Codable> (url: String, type: Type.Type, completion: @escaping ([Type]) -> ()) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared
        
        task.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode([Type].self, from: data)
                completion(response)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
