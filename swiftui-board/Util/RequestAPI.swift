//
//  RequestAPI.swift
//  swiftui-board
//
//  Created by nucpoop on 2023/04/01.
//

import Foundation

class RequestAPI: ObservableObject{
    static let shared = RequestAPI()
    private init() {}
    @Published var boards = [Board]()
    
    func fetchData(){
        guard let url = URL(string: "http://localhost:8080/board") else{
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url){ data, response, error in
            if let error = error{
                print("error: " + error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                self.boards = []
                return
            }
            guard let data = data else{
                return
            }
            do{
                let apiResponse = try JSONDecoder().decode([Board].self, from: data)
                DispatchQueue.main.async {
                    self.boards = apiResponse
                }
            }catch(let err){
                print("error: " + err.localizedDescription)
            }
        }
        task.resume()
    }
}
