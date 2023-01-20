//
//  WCRegisterWS.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import CLDUtilities
import Alamofire

struct WCRegisterWS {

    static let shared = WCRegisterWS()
    
    private init() { }
    
    func sendRegister(
        params: Parameters?,
        completion: @escaping Closures.Message,
        errorService: @escaping Closures.ErrorMessage
    ) {

        let endpoint = WebServicesURL.General.register

        CSWebServiceManager.shared.request.postRequest(
            urlString: endpoint,
            parameters: params
        ) { webServiceResponse in
            WCGenericResponse.sharedInstace.genericResponse(webServiceResponse) { json in
                completion(json.dictionary["token"]?.stringValue ?? "")
            } error: { errorMessage, stateToken in
                errorService(errorMessage)
            }
        }
    }
}
