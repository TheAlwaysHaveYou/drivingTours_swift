//
//  HTTPRequestManager.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/4/3.
//  Copyright © 2019 FKD. All rights reserved.
//

import Foundation
import Alamofire

typealias RequestFinishHandler = (Any , Bool) -> Void


class HTTPRequestManager {
    static let sharedInstance = HTTPRequestManager()
    private init() {}//防止调用init方法
    
    //GET请求
    class func getRequest(url:String , params:[String : Any]? , finish:@escaping RequestFinishHandler) -> () {
        Alamofire.request(url).responseJSON { (response) in
            switch response.result {
            case .success(_):
                finish(response , true)
            case .failure(_):
                finish(response , false)
            }
        }
    }
    //POST请求
    class func postRequest(url:String , params:[String : Any]? , finish:@escaping RequestFinishHandler) -> () {
        
        let cmd = url[serverBaseURL(add: "").endIndex ..< url.endIndex]
        let dictionary = ["cmd":cmd,"version":app_Version,"token":GlobalManager.sharedInstance.loginModel?.token ?? "","params":params ?? ["":""]] as [String : Any]
        Alamofire.request(url, method: .post, parameters: dictionary, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(_):
                finish(response , true)
            case .failure(_):
                finish(response.error?.localizedDescription ?? "网络请求出错" , false)
            }
        }
    }
    
    class func originPost(url:String , params:[String : Any]? , finish:@escaping RequestFinishHandler) -> () {
        var request = URLRequest.init(url: URL.init(string: url)!)
        request.httpMethod = "POST"
        request.timeoutInterval = 30.0
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
       let cmd = url[serverBaseURL(add: "").endIndex ..< url.endIndex]
        let dictionary = ["cmd":cmd,"version":app_Version,"token":GlobalManager.sharedInstance.loginModel?.token ?? "","params":params ?? ["":""]] as [String : Any]
        
        do {
            let body = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
            request.httpBody = body
        } catch let error {
            print("----JSONSerialization编码错误\(error)----")
        }
        //do catch 或者 try? try! 都行，但是有区别
//        let body = try? JSONSerialization.data(withJSONObject: params ?? ["":""], options: JSONSerialization.WritingOptions.prettyPrinted)
//        request.httpBody = body
        
        print("发送的参数----\(dictionary)")
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data? , response:URLResponse?, error:Error?) in
            
            if error == nil {
//                let result = String.init(data: data!, encoding: .utf8)
//                print("---\(String(describing: result))---")
//                finish(data! , true)
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                let detail = try? JSONSerialization.data(withJSONObject: json!["detail"] as! [String : Any], options: .prettyPrinted)
                print("解析的字典----\(String(describing: json))")
                finish(detail! , true)
            }else {
                print("网络请求出错-----\(String(describing: error?.localizedDescription))-----")
                finish(error?.localizedDescription ?? "网络请求出错", false)
            }
        }
        task.resume()
    }
}
