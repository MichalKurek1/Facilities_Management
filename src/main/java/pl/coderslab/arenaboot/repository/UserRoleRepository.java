package pl.coderslab.arenaboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.arenaboot.model.UserRole;


public interface UserRoleRepository extends JpaRepository<UserRole,String> {


}
