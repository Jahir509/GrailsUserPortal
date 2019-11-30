package com.bitmascot.taglib

import com.bitmascot.services.AuthenticationService

class uiTagLib {
    static namespace = "UIHelper"

    AuthenticationService authenticationService

    def renderErrorMessage = { attrs, body ->
        def model = attrs.model
        String fieldName = attrs.fieldName
        String errorMessage = attrs.errorMessage ? g.message(code: attrs.errorMessage) : g.message(code: "invalid.input")
        if (model && model.errors && model.errors.getFieldError(fieldName)) {
            out << "<p class='form-text text-danger''><strong>${errorMessage}</strong></p>"
        }

    }


    def memberActionMenu = { attrs, body ->
        out << '<li class="nav-item dropdown show">'
        out << g.link(class: "nav-link dropdown-toggle", "data-toggle": "dropdown") {
            authenticationService.getUserInfo()
        }
        out << '<div class="dropdown-menu">'
        out << g.link(controller: "authentication", action: "logout", class: "dropdown-item") {
            g.message(code: "logout")
        }
        out << "</div></li>"
    }


    def leftNavigation = { attrs, body ->
        List navigations = [
                [controller: "dashboard", action: "index", name: "Dashboard"],
                [controller: "dashboard", action: "changePassword", name: "Password"],

        ]

        if (authenticationService.isAdministratorUser()) {
            navigations.pop();
            navigations.add([controller: "user", action: "index", name: "user"])

        }

        navigations.each { menu ->
            out << '<li class="list-group-item">'
            out << g.link(controller: menu.controller, action: menu.action) { g.message(code: menu.name, args: ['']) }
            out << '</li>'
        }
    }

}
