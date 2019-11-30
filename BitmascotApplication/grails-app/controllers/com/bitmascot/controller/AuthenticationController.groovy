package com.bitmascot.controller

import com.bitmascot.services.AuthenticationService
import com.bitmascot.services.UserService
import com.bitmascot.userportal.AppUtil
import grails.converters.JSON

class AuthenticationController {
    AuthenticationService authenticationService
    UserService userService


    def login() {
        if (authenticationService.isAuthenticated()) {
            redirect(controller: "dashboard", action: "index")
        }

    }


    def doLogin() {
        if (authenticationService.doLogin(params.email, params.password)) {
            redirect(controller: "dashboard", action: "index")
        } else {
            flash.message = AppUtil.infoMessage("Invalid Input", false)
            redirect(controller: "authentication", action: "login")
        }
    }

    def checkUser() {
        def user = authenticationService.checkUser(params.email);
        if (user) {
            render user as JSON;
        }
        /*else {
            render false as JSON;
        }*/
    }


    def logout() {
        session.invalidate()
        redirect(controller: "authentication", action: "login")
    }

    def registration() {
        [user: flash.redirectParams]
    }

    def doRegistration() {

        def response = userService.Save(params)

        if (response.isSuccess) {
            authenticationService.setUserAuthorization(response.model)
            redirect(controller: "dashboard", action: "index")
        } else {
            flash.redirectParams = response.model
            //flash.message = AppUtil.infoMessage(g.message(code: "unable.to.save"), false)

            redirect(controller: "authentication", action: "registration")
        }
    }
}
