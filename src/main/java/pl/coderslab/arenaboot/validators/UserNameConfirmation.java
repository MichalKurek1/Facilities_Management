package pl.coderslab.arenaboot.validators;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.autoconfigure.security.SecurityProperties;
import pl.coderslab.arenaboot.model.UserName;
import pl.coderslab.arenaboot.repository.UserNameRepository;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.List;


public class UserNameConfirmation implements ConstraintValidator<UserNameConfirmator, String > {

    @Autowired
    UserNameRepository userNameRepository;


    @Override
    public void initialize(UserNameConfirmator userNameContirmator) {

    }

    @Override
    public boolean isValid(String userName, ConstraintValidatorContext constraintValidatorContext) {
        List<UserName> allUsers = userNameRepository.findAll();

        for (UserName user: allUsers) {

            if(user.getUserName().equals(userName)){
                return false;
            }
        }
        return true;
    }
}