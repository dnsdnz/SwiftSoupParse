//
//  SoupService.swift
//  AstroApp
//
//  Created by Deniz Cakmak on 9.09.2019.
//  Copyright © 2019 MacBook Air. All rights reserved.
//

import Foundation
import SwiftSoup

class HoroscopeService: NSObject {
    
    public static func getData(sign: String, time: String, completionHandler: @escaping (String) -> Void)  {
        do {
            let url = NSURL(string: "your URL")
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            if let data: Element = try document.select("div.YOURDIVNAME p").first() { //p for paragraphe
                let description = try data.text()
                completionHandler(description)
                print(description)
            }
        } catch {
            
        }
    }
    
   
}
