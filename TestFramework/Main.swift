//
//  Main.swift
//  TestFramework
//
//  Created by Nikita Zhukov on 06.05.2020.
//  Copyright © 2020 Nikita Zhukov. All rights reserved.
//

import Foundation
import CryptoSwift
import Curve25519

public class Main {
    
    public init() {
        print(try? HMAC(key: "kekus"))
    }
    
    public func keyLenght() -> Int {
        Curve25519.keyLength
    }
    
}
