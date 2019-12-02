//  web3swift
//
//  Created by Alex Vlasov.
//  Copyright © 2018 Alex Vlasov. All rights reserved.
//

import Foundation

public enum JSONRPCmethod: String, Encodable {
    
    case gasPrice = "aht_gasPrice"
    case blockNumber = "aht_blockNumber"
    case getNetwork = "net_version"
    case sendRawTransaction = "aht_sendRawTransaction"
    case sendTransaction = "aht_sendTransaction"
    case estimateGas = "aht_estimateGas"
    case call = "aht_call"
    case getTransactionCount = "aht_getTransactionCount"
    case getBalance = "aht_getBalance"
    case getCode = "aht_getCode"
    case getStorageAt = "aht_getStorageAt"
    case getTransactionByHash = "aht_getTransactionByHash"
    case getTransactionReceipt = "aht_getTransactionReceipt"
    case getAccounts = "aht_accounts"
    case getBlockByHash = "aht_getBlockByHash"
    case getBlockByNumber = "aht_getBlockByNumber"
    case personalSign = "aht_sign"
    case unlockAccount = "personal_unlockAccount"
    case createAccount = "personal_createAccount"
    case getLogs = "aht_getLogs"
    case getTxPoolInspect = "txpool_inspect"
    case getTxPoolStatus = "txpool_status"
    case getTxPoolContent = "txpool_content"

    
    public var requiredNumOfParameters: Int {
        get {
            switch self {
            case .call:
                return 2
            case .getTransactionCount:
                return 2
            case .getBalance:
                return 2
            case .getStorageAt:
                return 2
            case .getCode:
                return 2
            case .getBlockByHash:
                return 2
            case .getBlockByNumber:
                return 2
            case .gasPrice:
                return 0
            case .blockNumber:
                return 0
            case .getNetwork:
                return 0
            case .getAccounts:
                return 0
            case .getTxPoolStatus:
                return 0
            case .getTxPoolContent:
                return 0
            case .getTxPoolInspect:
                return 0
            default:
                return 1
            }
        }
    }
}

public struct JSONRPCRequestFabric {
    public static func prepareRequest(_ method: JSONRPCmethod, parameters: [Encodable]) -> JSONRPCrequest {
        var request = JSONRPCrequest()
        request.method = method
        let pars = JSONRPCparams(params: parameters)
        request.params = pars
        return request
    }
    
    public static func prepareRequest(_ method: InfuraWebsocketMethod, parameters: [Encodable]) -> InfuraWebsocketRequest {
        var request = InfuraWebsocketRequest()
        request.method = method
        let pars = JSONRPCparams(params: parameters)
        request.params = pars
        return request
    }
}
