package pl.coderslab.arenaboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.arenaboot.model.Proposition;
import pl.coderslab.arenaboot.model.UserName;

import java.util.List;
import java.util.Optional;


public interface UserNameRepository extends JpaRepository<UserName,String> {

    @Query("select u from UserName u where u.enabled=1")
    List<UserName> findAllActiveUsers();

    @Query("select u from UserName u where u.enabled=0")
    List<UserName> findAllDisactiveUsers();

    @Query("select u from UserName u where u.username =:username")
    UserName findByUserName(@Param("username") String username);

    @Query("select u from UserName u where u.enabled=1 and u.username.location=:location")
    List<UserName> findAllActiveUsersByLocation(@Param("location") String location);

    @Query("select u from UserName u where u.enabled=0 and u.username.location=:location")
    List<UserName> findAllDisactiveUsersBtLocation(@Param("location") String location);
}
