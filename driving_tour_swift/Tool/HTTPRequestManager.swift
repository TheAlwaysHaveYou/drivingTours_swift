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
    public class func getRequest(url:String , params:[String : Any]? , finish:@escaping RequestFinishHandler) -> () {
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
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(_):
                finish(response , true)
            case .failure(_):
                finish(response.error?.localizedDescription ?? "网络请求出错" , false)
            }
        }
    }
}
