package com.bitmascot.controller

import com.bitmascot.model.User
import com.bitmascot.services.AuthenticationService
import com.bitmascot.services.UserService
import com.bitmascot.userportal.AppUtil
import grails.converters.JSON

class DashboardController {
    AuthenticationService authenticationService;
    UserService userService;

    def index() {
        def response = authenticationService.getUser();
        [user: response];
    }
    def changePassword(){
        def response = authenticationService.getUser();
        [ user : response];
    }
    def updatePassword(){
        def response = authenticationService.getUser();
        if (!response) {
            redirect(controller: "dashboard", action: "changePassword")
        } else {
            response = authenticationService.UpdateUser(response, params);
            if (!response.isSuccess) {
                flash.redirecParams = response.model;
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.update"), false)
                redirect(controller: "dashboard", action: "changePassword");
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "updated"))
                redirect(controller: "dashboard", action: "index");
            }
        }
    }

    def checkUser(){
        def user = authenticationService.checkUser(params.email);
        if (user) {
            render user as JSON;
        }
    }

}
