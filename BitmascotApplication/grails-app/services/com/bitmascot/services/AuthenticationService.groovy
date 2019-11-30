package com.bitmascot.services

import com.bitmascot.model.User
import com.bitmascot.userportal.AppUtil
import com.bitmascot.userportal.GlobalConfig
import grails.converters.JSON
import grails.web.servlet.mvc.GrailsParameterMap

class AuthenticationService {

    private static final String AUTHORIZED = "AUTHORIZED"

    def setUserAuthorization(User user) {
        def authorization = [isLoggedIn: true, user: user]
        AppUtil.getAppSession()[AUTHORIZED] = authorization
    }

    def doLogin(String email, String password) {
        password = password.encodeAsMD5();
        User user = User.findByEmailAndPassword(email, password);
        if (user) {
            setUserAuthorization(user);
            return true;
        }
        return false;
    }

    boolean isAuthenticated() {
        def authorization = AppUtil.getAppSession()[AUTHORIZED]
        if (authorization && authorization.isLoggedIn) {
            return true
        }
        return false
    }


    def getUser() {
        def authorization = AppUtil.getAppSession()[AUTHORIZED]
        return authorization?.user
    }


    def getUserInfo() {
        def member = getUser()
        return "Hello!  ${user.firstname + ' ' + user.lastname}"
    }

    def isAdministratorUser() {
        def user = getUser();
        if (user && user.userType == GlobalConfig.USER_TYPE.ADMINISTRATOR) {
            return true;
        }
        return false;
    }

    def checkUser(String email) {
        User user = User.findByEmail(email);
        if (user) {
            return user;
        }
        return false;
    }
    //Update Method
    def UpdateUser(User user, GrailsParameterMap params) {
        user.properties = params;
        def response = AppUtil.saveResponse(false, user);
        if (user.validate()) {
            user.save(flush: true);
            if (!user.hasErrors()) {
                response.isSuccess = true;
            }
        }
        return response;
    }

}
