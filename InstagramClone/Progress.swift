//
//  Progress.swift
//  InstagramClone
//
//  Created by TAKESHI SHIMADA on 2018/11/18.
//  Copyright © 2018 The Zero2Launch Team. All rights reserved.
//

import Foundation
import Cactacea

class Progress {

    static func show(_ status: String) {
        ProgressHUD.show(status)
    }

    static func show(_ status: String, interaction: Bool) {
        ProgressHUD.show(status, interaction: interaction)
    }

    static func showSuccess(_ status: String) {
        ProgressHUD.showSuccess(status)
    }
    
    static func showSuccess(_ status: String, interaction: Bool) {
        ProgressHUD.showSuccess(status, interaction: interaction)
    }

    static func showError(_ status: String) {
        ProgressHUD.showError(status)
    }
    
    static func showError(_ status: String, interaction: Bool) {
        ProgressHUD.showError(status, interaction: interaction)
    }

    static func showError(_ error: Error) {
        if let err = error as? ErrorResponse {
            switch(err){
            case ErrorResponse.error(_, let data, _):
                if let data = data {
                    let decodeResult = CodableHelper.decode(CactaceaErrors.self, from: data)
                    if decodeResult.error == nil {
                        if let m = decodeResult.decodableObj?.errors.first {
                            ProgressHUD.showError(m.message)
                            return
                        }
                    }
                }
            }
            ProgressHUD.showError(error.localizedDescription)
        } else {
            ProgressHUD.showError(error.localizedDescription)
        }
    }

    static func dismiss() {
        ProgressHUD.dismiss()
    }

}
