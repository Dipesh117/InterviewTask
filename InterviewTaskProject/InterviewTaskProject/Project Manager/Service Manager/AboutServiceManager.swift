//
//  AboutServiceManager.swift
//  InterviewTaskProject
//
//  Created by Mac Mini on 14/06/21.
//

import Foundation


struct AboutSerViceManager {
    
    // Get About Data From URL
    func getAboutData(response: @escaping(AboutResponse?) -> (), errorCompletion: @escaping(Error?) -> ()) {
        
        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: request) { (responseData, resp, error) in
            
            guard let data = responseData else {
                errorCompletion(error)
                return
            }
            
            let utfData = String(decoding: data, as: UTF8.self).data(using: .utf8)
            
            do {
                
                // Model Mapping
                let aboutResponse = try? JSONDecoder().decode(AboutResponse.self, from: utfData ?? Data())
                
                if aboutResponse != nil {
                    
                    print(aboutResponse?.title ?? "")
                    
                    DispatchQueue.main.sync {
                        response(aboutResponse)
                    }
                }
                else {
                    DispatchQueue.main.sync {
                        errorCompletion(NSError(domain: "Data not found", code: 0, userInfo: nil))
                    }
                }
            }
        }
       
        datatask.resume();
    }
}
