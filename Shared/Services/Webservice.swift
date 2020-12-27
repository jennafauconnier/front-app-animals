//
//  Webservice.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Jenna Diop on 05/11/2020.
//

import Foundation

import Combine

class Webservice {
    
    func getAllAnimals(completion: @escaping ([Post]) -> ()) {
        
        guard let url = URL(string: "http://localhost:7000/home")
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let posts = try!
                JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
    
    func getOneAnimal(animalId: Int, completion: @escaping ([PostAnimal]) -> ()) {
        print("http://localhost:7000/animals/\(animalId)")
        guard let url = URL(string: "http://localhost:7000/animals/\(animalId)")
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let postsAnimal = try!
                JSONDecoder().decode([PostAnimal].self, from: data!)
            DispatchQueue.main.async {
                completion(postsAnimal)
            }
        }.resume()
    }
}
