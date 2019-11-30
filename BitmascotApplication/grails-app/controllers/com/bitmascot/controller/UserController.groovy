package com.bitmascot.controller

import com.bitmascot.model.User
import com.bitmascot.services.AuthenticationService
import com.bitmascot.services.UserService
import com.bitmascot.userportal.AppUtil
import grails.converters.JSON

class UserController {

    UserService userService;
    AuthenticationService authenticationService;

    def index() {
        def response = userService.GetAll(params);
        [userList: response.list, total: response.count]
    }

    def details(Integer id) {
        def response = userService.GetById(id);
        if (!response) {
            redirect(controller: "user", action: "index");
        } else {
            [user: response]
        }
    }

    def emailDetails(Integer id) {
        def response = userService.GetById(id);
        render response as JSON;
    }

    def create() {
        [user: flash.redirectParams]
    }

    def save() {
        def response = userService.Save(params);
        if (!response.isSuccess) {
            flash.redirectParams = response.model;
            //flash.message = AppUtil.infoMessage(g.message(code: "unable.to.save"), false)
            redirect(controller: "user", action: "create");
        } else {
            flash.message = AppUtil.infoMessage(g.message(code: "saved"))
            redirect(controller: "dashboard", action: "index", param: [id: response.id]);
        }
    }

    def edit(Integer id) {
        if (flash.redirectParams) {
            [user: flash.redirectParams]
        } else {
            def response = userService.GetById(id);
            if (!response) {
                flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
                redirect(controller: "user", action: "index");
            } else {
                [user: response]
            }
        }
    }

    def update() {
        def response = userService.GetById(params.id);
        if (!response) {
            redirect(controller: "user", action: "index")
        } else {
            response = userService.Update(response, params);
            if (!response.isSuccess) {
                flash.redirecParams = response.model;
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.update"), false)
                redirect(controller: "user", action: "edit");
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "updated"))
                redirect(controller: "user", action: "index");
            }
        }
    }

    def delete(Integer id) {
        def response = userService.GetById(id);
        if (!response) {
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
            redirect(controller: "user", action: "index");
        } else {
            response = userService.Delete(response);
            if (!response) {
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.delete"), false)
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "deleted"))
            }
            redirect(controller: "user", action: "index");
        }
    }


}
