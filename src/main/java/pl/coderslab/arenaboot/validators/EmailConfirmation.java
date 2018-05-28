package pl.coderslab.arenaboot.validators;

import org.springframework.beans.factory.annotation.Autowired;

import pl.coderslab.arenaboot.model.UserName;
import pl.coderslab.arenaboot.repository.UserNameRepository;



import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.List;

public class EmailConfirmation implements ConstraintValidator<EmailConfirmator, String> {

    @Autowired
    UserNameRepository userRepository;

    @Override
    public void initialize(EmailConfirmator emailConfirmator) {
    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {

        List<UserName> allUsers = userRepository.findAll();

        for (UserName user: allUsers) {

            if(user.getEmail().equals(email)){
                return false;
            }
        }
        return true;
    }
}