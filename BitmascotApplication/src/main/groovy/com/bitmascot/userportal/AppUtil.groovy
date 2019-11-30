package com.bitmascot.userportal

import org.grails.web.util.WebUtils

class AppUtil {
    static saveResponse(Boolean isSuccess, def model) {
        return [isSuccess: isSuccess, model: model]
    }

    //get session from Grails
    static getAppSession() {
        return WebUtils.retrieveGrailsWebRequest().session
    }

    static infoMessage(String message, Boolean status = true) {
        return [info: message, success: status]
    }
}
