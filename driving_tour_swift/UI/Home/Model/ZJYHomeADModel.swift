//
//  ZJYHomeADModel.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/4/15.
//  Copyright © 2019 FKD. All rights reserved.
//

import UIKit

class ZJYHomeADModel: ZJYBaseModel,Codable {
    /*
     pictureUrl    是    string        图片URL
     forwardUrl    是    string        链接URL
     dataList    是    JSONArray        数据列表    元素为JSONObject
     */
    var pictureUrl : String?
    var forwardUrl : String?
    var dataList : [ZJYHomeADSubModel]?
    
    /*
     一旦数据模型遵循了 Codable 协议，编译器自动会生成相关编码和解码的实现。
     该协议中还有一个叫 CodingKey 的协议，用来表示编码和解码的key。
     
     //编解码用的KEY
     private enum CodingKeys: String , CodingKey {
     case picthreUrl
     case forwardUrl
     case dataList
     }
     
     //Encodable需要实现的部分
     func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
     try container.encode(pictureUrl, forKey: CodingKeys.picthreUrl)
     try container.encode(forwardUrl, forKey: CodingKeys.forwardUrl)
     try container.encode(dataList, forKey: CodingKeys.dataList)
     }
     
     private enum SubKeys:String , CodingKey {
     case imageUrl
     case title
     case contentUrl
     }
     
     //Decodable需要实现的部分
     required init(from decoder: Decoder) throws {
     let value  = try decoder.container(keyedBy: CodingKeys.self)
     pictureUrl = try value.decode(String.self, forKey: CodingKeys.picthreUrl)
     forwardUrl = try value.decode(String.self, forKey: CodingKeys.forwardUrl)
     //        dataList   = try value.decode([ZJYHomeADSubModel].self, forKey: CodingKeys.dataList)
     
     let subValue = try value.nestedContainer(keyedBy: SubKeys.self, forKey: CodingKeys.dataList)
     
     }
     */
}

class ZJYHomeADSubModel: ZJYBaseModel , Codable {
    /*
     imageUrl    是    string    V256    图片地址
     title    是    string    V256    标题
     contentUrl    是    string    V256    链接地址    返回链接如果为空,说明不可跳转
     */
    var imageUrl : String?
    var title : String?
    var contentUrl : String?
    
//    private enum CodingKeys:String , CodingKey {
//        case imageUrl
//        case title
//        case contentUrl
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(imageUrl, forKey: CodingKeys.imageUrl)
//        try container.encode(title, forKey: CodingKeys.title)
//        try container.encode(contentUrl, forKey: CodingKeys.contentUrl)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let value  = try decoder.container(keyedBy: CodingKeys.self)
//        imageUrl   = try value.decode(String.self, forKey: CodingKeys.imageUrl)
//        title      = try value.decode(String.self, forKey: CodingKeys.title)
//        contentUrl = try value.decode(String.self, forKey: CodingKeys.contentUrl)
//    }
}
