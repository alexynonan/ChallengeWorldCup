//
//  WCHomeWS.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import CLDUtilities
import Alamofire

struct WCHomeWS {

    static let shared = WCHomeWS()
    
    private init() { }
    
    func getHome(
        completion: @escaping Closures.SuccessHome,
        errorService: @escaping Closures.ErrorMessage
    ) {

        let endpoint = WebServicesURL.General.home
        
        CSWebServiceManager.shared.request.getRequest(
            urlString: endpoint,
            header: WCSessionBL.getUserSession()?.getToken,
            parameters: nil
        ) { webServiceResponse in

            WCGenericResponse.sharedInstace.genericResponse(webServiceResponse) { json in
                var array = [WCHome]()
                for item in json.array {
                    array.append(WCHome(item))
                }
                completion(array)
            } error: { errorMessage, stateToken in
                errorService(errorMessage)
            }
        }
    }
}
