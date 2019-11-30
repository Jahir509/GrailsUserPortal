package com.bitmascot.controller

import com.bitmascot.services.AuthenticationService
import com.bitmascot.userportal.AppUtil

class UserInterceptor {
    AuthenticationService authenticationService

    boolean before() {
        if (authenticationService.isAdministratorUser()) {
            return true
        }
        flash.message = AppUtil.infoMessage("You are not authorised for this action", false);
        redirect(controller: "dashboard", action: "index");
        return false
    }

}
