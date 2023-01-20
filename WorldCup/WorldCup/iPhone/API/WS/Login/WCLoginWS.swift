//
//  WCLoginWS.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import Alamofire
import CLDUtilities

struct WCLoginWS {

    static let shared = WCLoginWS()
    
    private init() { }
    
    func getLogin(
        params: Parameters?,
        completion: @escaping Closures.Message,
        errorService: @escaping Closures.ErrorMessage
    ) {

        let endpoint = WebServicesURL.General.login

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

