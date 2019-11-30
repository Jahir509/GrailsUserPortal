package com.bitmascot.services

import com.bitmascot.model.User
import com.bitmascot.userportal.AppUtil
import com.bitmascot.userportal.GlobalConfig
import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.jws.soap.SOAPBinding

@Transactional
class UserService {

    //Save Method
    def Save(GrailsParameterMap params) {
        User user = new User(params);

        def response = AppUtil.saveResponse(false, user);
        if (user.validate()) {
            user.save(flush: true);
            if (!user.hasErrors()) {
                response.isSuccess = true;
            }
        }
        return response;
    }

    //Update Method
    def Update(User user, GrailsParameterMap params) {
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

    //Get By Id
    def GetById(Serializable id) {
        return User.get(id);
    }

    def GetByEmail(String email) {
        return User.findByEmail(email);
    }

    //Delete a User
    def Delete(User user) {
        try {
            user.delete(flush: true);
        }
        catch (Exception e) {
            println(e.getMessage());
            return false;
        }
        return true;
    }

    // GetAll User
    def GetAll(GrailsParameterMap params) {
        params.max = params.max ?: GlobalConfig.itemsPerPage()
        List<User> userList = User.createCriteria().list(params) {
            if (params?.colName && params?.colValue) {
                like(params.colName, "%" + params.colValue + "%");
            }
            if (!params.sort) {
                order("id", "desc")
            }
        }
        return [list: userList, count: User.count()];
    }
}
