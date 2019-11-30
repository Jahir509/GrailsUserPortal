package com.bitmascot.services

import com.bitmascot.model.User
import com.bitmascot.userportal.GlobalConfig

class AppInitializerService {
    static initialize() {
        initUser()
    }

    private static initUser() {
        if (User.count() == 0) {
            User user = new User();
            user.firstname = "Admin";
            user.lastname = "User";
            user.address = "Bitmascot";
            user.phone = "01991339009";
            user.birthdate = "1/1/2019";
            user.email = "admin@gmail.com";
            user.isActive = true;
            user.password = "admin";
            user.userType = GlobalConfig.USER_TYPE.ADMINISTRATOR;
            user.save(flash: true);
        }
    }
}
