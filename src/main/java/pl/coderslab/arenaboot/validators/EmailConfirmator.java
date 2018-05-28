package pl.coderslab.arenaboot.validators;



import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Constraint(validatedBy =EmailConfirmation.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface EmailConfirmator {

    String message() default "{Poday mail jest już w bazie}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

}