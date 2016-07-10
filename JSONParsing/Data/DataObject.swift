//
//  DataObject.swift
//  JSONParsing
//
//  Created by Sanchika on 28/06/16.
//  Copyright © 2016 Sanchika. All rights reserved.
//
import Foundation

class DataObject {
    
    var singleDictionaryObject: NSDictionary?
    
    var name:String?
    var id: String?
    var email: String?
    var phone: String?
    var username: String?
    var website: String?
    var companyInfo: CompanyInfo?
    var address: AddressInfo?
    
    init(data: NSDictionary)
    {
        self.singleDictionaryObject = data
        self.name = data["name"] as? String
        self.id = data["id"] as? String
        self.email = data["email"] as? String
        self.phone = data["phone"] as? String
        self.username = data["username"] as? String
        self.website = data["website"] as? String
        self.companyInfo = CompanyInfo(companyInfo: data["company"] as! NSDictionary)
        self.address = AddressInfo(addressInfo: data["address"] as! NSDictionary)
    }
    
    struct CompanyInfo
    {
        internal var name: String?
        internal var catchPhrase: String?
        internal var bs: String?
        internal var testDic:NSMutableDictionary = [:]
        
        init(companyInfo: NSDictionary)
        {
            testDic.setValue(companyInfo["name"], forKey: "name")
            testDic.setValue(companyInfo["catchPhrase"], forKey: "catchPhrase")
            testDic.setValue(companyInfo["bs"], forKey: "bs")
            self.name = String(companyInfo["name"])
            self.catchPhrase = String(companyInfo["catchPhrase"])
            self.bs = String(companyInfo["bs"])
        }
    }
    
    struct AddressInfo
    {
        var street: String?
        var suite: String?
        var city: String?
        var zipcode: String?
        var geo: AddressGeo?
        var test2:NSMutableDictionary = [:]
        
        init(addressInfo: NSDictionary)
        {
            test2.setValue(addressInfo["street"], forKey: "street")
            test2.setValue(addressInfo["suite"], forKey: "suite")
            test2.setValue(addressInfo["city"], forKey: "city")
            test2.setValue(addressInfo["zipcode"], forKey: "zipcode")
            
            self.street = String(addressInfo["street"])
            self.suite = String(addressInfo["suite"])
            self.city = String(addressInfo["city"])
            self.zipcode = String(addressInfo["zipcode"])
            
            self.geo = AddressGeo(addressGeo: addressInfo["geo"] as! NSDictionary)
        }
    }
    
    struct AddressGeo
    {
        var lon: String?
        var lat: String?
        
        init(addressGeo: NSDictionary)
        {
            self.lon = String()
            self.lat = String()
        }
    }
    
}