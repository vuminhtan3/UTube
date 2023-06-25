//
//  Model.swift
//  UTube
//
//  Created by Minh Tan Vu on 25/06/2023.
//

import Foundation

class Model {
    func getVideo() {
        
        //Create URL
        let url = URL(string: Constants.apiURL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession Object
        let session = URLSession.shared
        
        // Get a dataTask from URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check if there were any error
            if error != nil || data == nil {
                return
            }
            //Parsing the data into video objects
            print(url)
        }
        
        //Kick off the task
        dataTask.resume()
    }
}
