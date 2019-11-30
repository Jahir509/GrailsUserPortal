package bitmascotapplication

import com.bitmascot.services.AppInitializerService

class BootStrap {

    def init = { servletContext ->
        AppInitializerService.initialize()
    }
    def destroy = {
    }
}
