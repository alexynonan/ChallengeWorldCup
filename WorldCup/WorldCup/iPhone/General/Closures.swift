//
//  Closures.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import SwiftyJSON

struct Closures {

    //MARK: General
    typealias ErrorMessage = (_ errorMessage: String) -> Void
    typealias ErrorMessageTK = (_ errorMessage: String,_ stateToken: Bool) -> Void
    typealias Message = (_ message: String) -> Void
    typealias Success = () -> Void
    typealias SuccessHome = (_ response: [WCHome]) -> Void
    typealias Image = (_ image: UIImage)   -> Void

    //MARK: WebServices
    typealias SuccessResponse = (_ response: JSON,_ status: Int) -> Void
    typealias FailureResponse = (_ errorMessage: String) -> Void
}
