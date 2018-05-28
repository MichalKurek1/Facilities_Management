package pl.coderslab.arenaboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.arenaboot.model.Proposition;


import java.util.List;


public interface PropositionRepository extends JpaRepository<Proposition,Long> {

    @Query("select p from Proposition p where p.week =:week and p.user.enabled=1")
    List<Proposition> findAllByWeek(@Param("week") String week);

    @Query("select p from Proposition p where p.week =:week and p.user.enabled=1 and p.user.location=:location")
    List<Proposition> findAllByWeekAndByLocation(@Param("week") String week, @Param("location") String location);

    @Query("select p from Proposition p where p.week=:week and p.user.enabled=1 and p.user.username =:username")
    Proposition findByUserNameAndWeek(@Param("username") String username, @Param("week") String week);

    @Query("select p from Proposition p where p.user.location=?2 and (p.nd like %?1% or p.pon like %?1% or p.wt like %?1% or p.sr like %?1% or p.czw like %?1% or p.pt like %?1%) order by p.week asc")
    List<Proposition> findAllByMonthAndLocation(String date, String location);

    @Query("select p from Proposition p where (p.nd like %?1% or p.pon like %?1% or p.wt like %?1% or p.sr like %?1% or p.czw like %?1% or p.pt like %?1%) order by p.week asc")
    List<Proposition> findAllByMonth(String month);
}






