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

    //给Alamofire这是请求时间的一种方式，使用时直接sharedSessionManager.request..........
    static let sharedSessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        return Alamofire.SessionManager(configuration: configuration)
    }()
    //设置请求时间的第二种方式，使用原始的URLRequest设置， 然后Alamofire.reuest(urlreuest)
    
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

//        let headers: HTTPHeaders = [
//            "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
//            "Content-Type": "application/json"
//        ]

        //发送json格式的参数 JSONEncoding.default
        Alamofire.request(url, method: .post, parameters: dictionary, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(_):
                finish(response.data! , true)
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
        /*
         如果在 try? 语句中抛出一个错误，则表达式的值为 nil
         如果在 try! 抛出一个异常，则会导致运行时错误；否则获取返回值
         */
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
