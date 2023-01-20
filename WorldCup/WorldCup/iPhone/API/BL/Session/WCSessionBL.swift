//
//  WCSessionBL.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import CLDUtilities

class WCSessionBL: NSObject {
    
    public static let accountSession = "WCUser"
    public static let serviceSession = "session"

    class func saveSession(_ objUserSession : WCUser) -> Bool {
        
        CSKeyChain.shared.deleteKeychain()
        WCUser.shared = objUserSession
        
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: objUserSession, requiringSecureCoding: false) {
            CSKeyChain.shared.saveDataInKeychain(data, withAccount: self.accountSession, withService: self.serviceSession)
            return true
        }else{
            print("NO SE GUARDO LA SESSIÓN")
            return false
        }
    }
    
    class func updateSession(_ objUserSession : WCUser) {
        
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: objUserSession, requiringSecureCoding: false) {
            WCUser.shared = objUserSession
            CSKeyChain.shared.updateDataInKeychain(data, withAccount: self.accountSession, withService: self.serviceSession)
        }else{
            print("NO SE ACTUALIZÓ LA SESSIÓN")
        }
    }

    class func getUserSession() -> WCUser? {
        
        guard let session = WCUser.shared else {
            
            if let dataUser = CSKeyChain.shared.dataFromKeychainWithAccount(self.accountSession, withService: self.serviceSession) {
                let objUser = (try? NSKeyedUnarchiver.unarchivedObject(ofClass: WCUser.self, from: dataUser)) ?? WCUser()
                WCUser.shared = objUser
                return objUser
            }else{
                return nil
            }
        }
        
        return session
    }
    
    class func deleteUserSession() {
        WCUser.shared = nil
        guard let data = CSKeyChain.shared.dataFromKeychainWithAccount(self.accountSession, withService: self.serviceSession) else { return }
        CSKeyChain.shared.deleteDataInKeychain(data, withAccount: self.accountSession, withService: self.serviceSession)
    }

    class func closeSession(){
        WCUser.shared = nil
    }
    
}
