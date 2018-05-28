package pl.coderslab.arenaboot.model;

import java.util.ArrayList;
import java.util.List;

public class UserRoleList {

    private List<UserRole> userRoleList = new ArrayList<>();

    public UserRoleList(){

    }

    public UserRoleList(List<UserRole> userRole) {
        for(UserRole prop: userRole){
            userRoleList.add(prop);
        }
    }

    public List<UserRole> getUserRoleList() {
        return userRoleList;
    }

    public void setUserRoleList(List<UserRole> proposition) {
        this.userRoleList = proposition;
    }

}
