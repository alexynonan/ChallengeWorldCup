//
//  WCGenericResponse.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import CLDUtilities

struct WCGenericResponse {

    static let sharedInstace = WCGenericResponse()

    private init () { }
    
    //    MARK: - VALIDATION RESPONSE DATA DEFAULTS
    func genericResponse(_ response: CSWebServiceResponse,
                                      success: (_ json: CSJSON) -> Void,
                                      error: @escaping Closures.ErrorMessageTK) {
   
        if response.JSON?.dictionary["status"]?.stringValue == "success"{
            
            if let data = response.JSON?.dictionary["data"] {
                success(data)
            }

        } else {
            let message = self.manageErrorFromResponse(response)
            error(message.0, message.1)
        }
    }
    
    private func manageErrorFromResponse(_ response: CSWebServiceResponse? = nil) -> (String, Bool) {

        if let message = response?.JSON?.dictionary["message"]{
            return (message.stringValue ?? "", false)
        }else if let message = response?.JSON?.dictionary["error"]{
            return (message.stringValue ?? "", true)
        }else{
            return ("Problemas con el Servicio", false)
        }
   }
}
