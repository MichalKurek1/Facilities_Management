package pl.coderslab.arenaboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.arenaboot.model.*;
import pl.coderslab.arenaboot.repository.LocationRepository;
import pl.coderslab.arenaboot.repository.PropositionRepository;
import pl.coderslab.arenaboot.repository.UserNameRepository;
import pl.coderslab.arenaboot.repository.UserRoleRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @Autowired
    PropositionRepository propositionRepository;

    @Autowired
    UserNameRepository userNameRepository;

    @Autowired
    UserRoleRepository userRoleRepository;

    @Autowired
    LocationRepository locationRepository;

    @GetMapping("/all")
    public String showAll1(Model model) {
        List<UserName> activeUsers = userNameRepository.findAllActiveUsers();
        List<UserName> disactiveUsers = userNameRepository.findAllDisactiveUsers();
        model.addAttribute("users", activeUsers);
        model.addAttribute("disactiveUsers", disactiveUsers);
        return "admin/listEmpAdmin";
    }

    @RequestMapping("/delete/{param1}")
    public String disactivate(@PathVariable String param1) {
        UserName user = userNameRepository.findByUserName(param1);
        user.setEnabled(0);
        userNameRepository.save(user);
        return "redirect:/admin/all";
    }

    @RequestMapping("/getback/{param1}")
    public String activate(@PathVariable String param1) {
        UserName user = userNameRepository.findByUserName(param1);
        user.setEnabled(1);
        userNameRepository.save(user);
        return "redirect:/admin/all";
    }

    @RequestMapping(value=("/roles"), method = RequestMethod.GET)
    public String roles(Model model){
        List<UserRole> list = userRoleRepository.findAll();
        model.addAttribute("list", new UserRoleList(list));
        return "admin/roles";
    }

    @RequestMapping(value=("/roles"), method = RequestMethod.POST)
    public String rolesSave(@ModelAttribute("list") UserRoleList userRoleList){
    List<UserRole> roles = userRoleList.getUserRoleList();
    for(UserRole prop:roles){
        userRoleRepository.save(prop);
    }
        return "admin/roles";
    }

    @ModelAttribute("roles")
    public String[] avaiableRols(){
        return new String[]{"ROLE_ADMIN","ROLE_MANAGER", "ROLE_USER"};
    }


    @GetMapping("/update/{param1}")
    public String updateForm(Model model, @PathVariable String param1) {
        model.addAttribute("user", userNameRepository.findByUserName(param1));
        return "admin/updateEmp";
    }

    @PostMapping("/update/{param1}")
    public String update(@Valid @ModelAttribute("user") UserName user, BindingResult result) {

        if(result.hasErrors()){
            return "admin/updateEmp";
        }
        userNameRepository.save(user);
        return "redirect:/admin/all";
    }

    @RequestMapping(value="/salary", method = RequestMethod.GET)
    public String creatSalaryList(Model model){
        List<Location> locationList = getLocation();
        model.addAttribute("locationList", locationList);
        return "admin/salary";
    }

    @RequestMapping(value="/salary", method = RequestMethod.POST)
    public String creatSalaryListPost(HttpServletRequest request, Model model){
        String location = request.getParameter("location");
        String name = request.getParameter("month");
        List<Location> locationList = getLocation();

        if(name !=null || !name.isEmpty()) {
            String[] name1 = name.split("-");
            String month1 = name1[1] + "-" + name1[0];

            List<Proposition> month = propositionRepository.findAllByMonthAndLocation(month1, location);
            List<String> list = new ArrayList<>();

            for (Proposition prop : month) {
                double sum = prop.getWeekHours();
                if (!prop.getPon().contains(month1)) {
                    double pon = hourDifference(prop.getPonStartFinal(), prop.getPonEndFinal());
                    sum = sum - pon;
                    prop.setWeekHours(sum);
                }
                if (!prop.getWt().contains(month1)) {
                    double wt = hourDifference(prop.getWtStartFinal(), prop.getWtEndFinal());
                    sum = sum - wt;
                    prop.setWeekHours(sum);
                }
                if (!prop.getSr().contains(month1)) {
                    double sr = hourDifference(prop.getSrStartFinal(), prop.getSrEndFinal());
                    sum = sum - sr;
                    prop.setWeekHours(sum);
                }
                if (!prop.getCzw().contains(month1)) {
                    double czw = hourDifference(prop.getCzwStartFinal(), prop.getCzwEndFinal());
                    sum = sum - czw;
                    prop.setWeekHours(sum);
                }
                if (!prop.getPt().contains(month1)) {
                    double pt = hourDifference(prop.getPtStartFinal(), prop.getPtEndFinal());
                    sum = sum - pt;
                    prop.setWeekHours(sum);
                }
                if (!prop.getSb().contains(month1)) {
                    double sb = hourDifference(prop.getSbStartFinal(), prop.getSbEndFinal());
                    sum = sum - sb;
                    prop.setWeekHours(sum);
                }
                if (!prop.getNd().contains(month1)) {
                    double nd = hourDifference(prop.getNdStartFinal(), prop.getNdEndFinal());
                    sum = sum - nd;
                    prop.setWeekHours(sum);
                }
            }
            for (Proposition prop : month) {
                if (!list.contains(prop.getUser().getUserName())) {
                    list.add(prop.getUser().getUserName());
                }
            }

            model.addAttribute("locationList", locationList);
            model.addAttribute("list", list);
            model.addAttribute("month", month);

            return "admin/salary2";
        }else
            model.addAttribute("locationList", locationList);
            return "admin/salary";
    }

    @ModelAttribute("location")
    List<Location> getLocation(){
        List<Location> locations = locationRepository.findAll();
        return locations;
    }

    public double hourDifference(String start, String finish){
        double result= stringToHour(finish) - stringToHour(start);
        return result;
    }

    public double stringToHour(String hour) {

        if(hour ==null || hour.isEmpty()) {
            return 0;
        }else{
            String[] value = hour.split(":");
            double hours = Double.parseDouble(value[0]);
            double minutes = Double.parseDouble(value[1]);
            if (minutes != 0) {
                return hours + 0.5;
            }
            return hours;
        }
    }
}

