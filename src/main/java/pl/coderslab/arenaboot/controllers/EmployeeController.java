package pl.coderslab.arenaboot.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.arenaboot.model.Proposition;

import pl.coderslab.arenaboot.model.UserName;
import pl.coderslab.arenaboot.repository.PropositionRepository;
import pl.coderslab.arenaboot.repository.UserNameRepository;


import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    PropositionRepository propositionRepository;

    @Autowired
    UserNameRepository userRepository;

    @Autowired
    UserNameRepository userNameRepository;

    @RequestMapping(value = "add")
    public String add(Model model){
        model.addAttribute("proposition", new Proposition());
        return "employee/employee";
    }

    @RequestMapping(value = "add2")
    public String add2(Model model){
        model.addAttribute("proposition", new Proposition());
        return "employee/employee2";
    }


    @RequestMapping(value = "add/week={param1}", method = RequestMethod.GET)
    public String add(Model model, Principal principal, @PathVariable String param1) {
        UserName user = userNameRepository.findByUserName(principal.getName());
        model.addAttribute("user", user);

        Proposition proposition = propositionRepository.findByUserNameAndWeek(principal.getName(), param1);

        if(proposition==null){
            model.addAttribute("proposition", new Proposition());
        }else {
            model.addAttribute("proposition", proposition);
        }
        return "employee/employee";
    }

    @RequestMapping(value = "add/week={param1}", method = RequestMethod.POST)
    public String addPlan(@Valid Proposition proposition,
                          BindingResult result,
                          Principal principal,
                          Model model, @PathVariable String param1) {


            if (result.hasErrors()) {
                return "redirect:week="+param1;
            }
            propositionRepository.save(proposition);

        return "redirect:week="+param1;
    }

    @ModelAttribute("users")
    public List<UserName> getUsers() {
        return userRepository.findAll();
    }

    @RequestMapping(value = "schedule", method = RequestMethod.GET)
    public String schedule() {
        return "employee/schedule";
    }


    @RequestMapping(value = "schedule/week={param1}", method = RequestMethod.GET)
    public String getSchedule(Model model, Principal principal, @PathVariable String param1) {

        String user = principal.getName();
        Proposition schedule =propositionRepository.findByUserNameAndWeek(user, param1);
        UserName userName = userRepository.findByUserName(user);
        String location = userName.getLocation();
        List<Proposition> scheduleLocation = propositionRepository.findAllByWeekAndByLocation(param1, location);
        model.addAttribute("scheduleLocation", scheduleLocation);
        model.addAttribute("schedule", schedule);
        return "employee/schedule";
    }

}
