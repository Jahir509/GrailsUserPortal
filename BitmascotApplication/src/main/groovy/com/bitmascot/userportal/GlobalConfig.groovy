package com.bitmascot.userportal

class GlobalConfig {
    public static final def USER_TYPE = [
            ADMINISTRATOR: "ADMINISTRATOR",
            REGULAR_USER : "REGULAR_USER"
    ]

    public static Integer itemsPerPage() {
        return 5;
    }
}
