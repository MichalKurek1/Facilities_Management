package pl.coderslab.arenaboot.validators;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy =UserNameConfirmation.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface UserNameConfirmator{

    String message() default "{Podany użytkownik już istnieje}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

}
