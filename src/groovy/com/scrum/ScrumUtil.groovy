package com.scrum

/**
 * Created with IntelliJ IDEA.
 * User: techtalk
 * Date: 6/10/14
 * Time: 12:35 PM
 * To change this template use File | Settings | File Templates.
 */
class ScrumUtil {
    public static EXCLUDE_FIELD_LIST = ['class', 'createdBy', 'tasks', 'dateCreated', 'lastUpdated'];

    public String getStr() {
        String ret = "";

        if (ret == null) ret = "teafdadf"

        def var1 = [1, null, Boolean.FALSE, 'x', true]
        def var2 = [1, null, Boolean.FALSE, 'x', true]        // violation

        return ret;
    }
}
