package pl.coderslab.arenaboot.model;


import org.springframework.format.annotation.NumberFormat;
import org.springframework.security.crypto.bcrypt.BCrypt;
import pl.coderslab.arenaboot.validators.EmailConfirmator;
import pl.coderslab.arenaboot.validators.UserNameConfirmator;


import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Email;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class UserName {


    @NotBlank(message = "Podaj imię")
    private String firstName;

    @NotBlank(message = "Podaj nazwisko")
    private String lastName;

    @Id
    @NotNull(message = "Podaj nazwę użytkownika")
//    @UserNameConfirmator
    @Column(unique = true)
    private String username;

    @NotNull(message = "Podaj email")
    @Email(message = "Niepoprawny email")
//    @EmailConfirmator
    @Column(unique = true)
    private String email;

    @NotBlank(message = "Podaj hasło")
    @Size(min = 8, message = "Hasło musi mieć przynajmniej 8 znaków")
    private String password;

    @NotNull
    @Min(value = 111111111, message = "Numer musi mieć przynajmniej 9 cyfr")
    private int number;

    @NotNull(message = "Wybierz obiekt")
    private String location;

    @OneToMany
    private List<Proposition> propositions;

    private double hourRate;

    private int enabled;

    public UserName() {
    }

    public double getHourRate() {
        return hourRate;
    }

    public void setHourRate(double hourRate) {
        this.hourRate = hourRate;
    }

    public List<Proposition> getPropositions() {
        return propositions;
    }

    public void setPropositions(List<Proposition> propositions) {
        this.propositions = propositions;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return username;
    }

    public void setUserName(String userName) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
        hashPassword();
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getEnabled() {

        return enabled;
    }

    public void setEnabled(int i) {
        this.enabled = 1;
        if (i == 0) {
            this.enabled = 0;
        }
    }

    private void hashPassword() {

        this.password = BCrypt.hashpw(this.password, BCrypt.gensalt());


    }

}
