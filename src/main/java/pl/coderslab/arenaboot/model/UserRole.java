package pl.coderslab.arenaboot.model;

import javax.persistence.*;

@Entity
@Table(name = "authorities")
public class UserRole {

    @Id
    private String username;

    private String authority;

    public UserRole() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }
}
