//
//  UploadToken.swift
//  NBALiveActivities
//
//  curl --location --request POST 'http://gwtest.m.163.com/media/push/register/register?token=token&deviceId=deviceId'
//
//  Created by JerryLiu on 2022/10/27.
//

import Foundation
import UIKit

class UploadManager: NSObject {
    
    public func uploadToken(tokenString: String) {
        if tokenString == "" {
            return
        }
        
        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        
        var url = URLComponents(string: "http://gwtest.m.163.com/media/push/register/register")!

        url.queryItems = [
            URLQueryItem(name: "token", value: tokenString),
            URLQueryItem(name: "deviceId", value: deviceId)
        ]
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
