package com.bitmascot.model

import com.bitmascot.userportal.GlobalConfig
import grails.rest.Resource

//@Resource(uri='/users',formats=['json','xml'])
class User {

    Integer id
    String firstname
    String lastname
    String address
    String phone
    String email
    String birthdate
    String password
    String userType = GlobalConfig.USER_TYPE.REGULAR_USER
    Boolean isActive = true


    static constraints = {
        email(email: true, nullable: false, blank: false, unique: true)
        password(blank: false)
        firstname(nullable: false)
        lastname(nullable: false)
        address(nullable: false)
        phone(nullable: false)
        birthdate(nullable: false)
    }

    def beforeInsert() {
        this.password = this.password.encodeAsMD5()
    }

    def beforeUpdate() {
        this.password = this.password.encodeAsMD5()
    }
}
