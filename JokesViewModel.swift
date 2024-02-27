//
//  JokesViewModel.swift
//  JokesApp
//
//  Created by Aydın KAYA on 27.02.2024.
//

import Foundation
import Alamofire

class JokesViewModel : ObservableObject{
    
    @Published var jokes = [Value]()     // I can observe it in the contentview file
    
    init() {
        getJokes()
    }
    
    func getJokes(count: Int = 6){
        
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json",method: .get).responseDecodable(of:Welcome.self) { response in
            
            switch response.result{
                
            case.success(let data):
                let value = data.value
                self.jokes += value
                
            case.failure(let error):
                
                print(error)
                
                
                
                
            }
            
            
        }
    }
 
}
