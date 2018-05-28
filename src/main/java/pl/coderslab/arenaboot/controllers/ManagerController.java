package pl.coderslab.arenaboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.arenaboot.model.*;
import pl.coderslab.arenaboot.repository.LocationRepository;
import pl.coderslab.arenaboot.repository.PropositionRepository;
import pl.coderslab.arenaboot.repository.UserNameRepository;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.Validator;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/man")
public class ManagerController {


    @Autowired
    UserNameRepository userNameReopsitory;

    @Autowired
    PropositionRepository propositionRepository;

    @Autowired
    LocationRepository locationRepository;

    @Autowired
    Validator validator;

    @RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
    public String addEmp(Model model) {
        model.addAttribute("user", new UserName());
        return "manager/addEmp";
    }

    @RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
    public String addEmpSave(@Valid @ModelAttribute("user") UserName user, BindingResult result) {

        if (result.hasErrors()) {
            return "manager/addEmp";
        }
        userNameReopsitory.save(user);
        return "redirect:/man/all";
    }

    @GetMapping("/all")
    public String showAll(HttpServletRequest request, Model model) {
        Principal principal = request.getUserPrincipal();
        UserName manager = userNameReopsitory.findByUserName(principal.getName());

        List<UserName> activeUsers = userNameReopsitory.findAllActiveUsersByLocation(manager.getLocation());
        List<UserName> disactiveUsers = userNameReopsitory.findAllDisactiveUsersBtLocation(manager.getLocation());

        model.addAttribute("users", activeUsers);
        model.addAttribute("disactiveUsers", disactiveUsers);
        return "manager/listEmp";
    }

    @GetMapping("/update/{param1}")
    public String updateForm(Model model, @PathVariable String param1) {
        model.addAttribute("user", userNameReopsitory.findByUserName(param1));
        return "manager/updateEmp";
    }

    @PostMapping("/update/{param1}")
    public String update(@Valid @ModelAttribute("user") UserName user, BindingResult result) {

        if (result.hasErrors()) {
            return "manager/updateEmp";
        }
        userNameReopsitory.save(user);
        return "redirect:/man/all";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String addChart() {
        return "manager/creatChart";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String addChartDate() {
        return "manager/creatChart";
    }

    @RequestMapping(value = "/username", method = RequestMethod.GET)
    @ResponseBody
    public String currentUserNameSimple(HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        return principal.getName();
    }

    @RequestMapping(value = "/week", method = RequestMethod.GET)
    public String week() {
        return "manager/Week";
    }

    @RequestMapping(value = "/createSchedule", method = RequestMethod.GET)
    public String createSchedule() {
        return "manager/createSchedule";
    }

    @RequestMapping(value = "/createSchedule/week={param1}", method = RequestMethod.GET)
    public String createScheduleParam(Model model, @PathVariable String param1, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        String user = principal.getName();
        UserName manager = userNameReopsitory.findByUserName(user);

        List<Proposition> proposition = propositionRepository.findAllByWeekAndByLocation(param1, manager.getLocation());
        model.addAttribute("propositionListCmd", new PropositionList(proposition));

        List<Proposition> proposition1 = propositionRepository.findAllByWeek(param1);
        model.addAttribute("proposition", proposition1);

        return "manager/createSchedule";
    }

    @RequestMapping(value = "/createSchedule/week={param1}", method = RequestMethod.POST)
    public String createScheduleParamPost(@ModelAttribute("proposition") PropositionList propositionListCmd, @PathVariable String param1) {

        List<Proposition> proposition = propositionListCmd.getPropositionList();

        for (Proposition prop : proposition) {
            double pon = hourDifference(prop.getPonStartFinal(), prop.getPonEndFinal());
            double wt = hourDifference(prop.getWtStartFinal(), prop.getWtEndFinal());
            double sr = hourDifference(prop.getSrStartFinal(), prop.getSrEndFinal());
            double czw = hourDifference(prop.getCzwStartFinal(), prop.getCzwEndFinal());
            double pt = hourDifference(prop.getPtStartFinal(), prop.getPtEndFinal());
            double sb = hourDifference(prop.getSbStartFinal(), prop.getSbEndFinal());
            double nd = hourDifference(prop.getNdStartFinal(), prop.getNdEndFinal());
            double sum = pon + wt + sr + czw + pt + sb + nd;
            prop.setWeekHours(sum);
            propositionRepository.save(prop);
        }
        return "redirect:week=" + param1;
    }

    @RequestMapping(value = "/salary", method = RequestMethod.GET)
    public String creatSalaryList() {
        return "manager/salary";
    }

    @RequestMapping(value = "/salary", method = RequestMethod.POST)
    public String creatSalaryListPost(HttpServletRequest request, Model model) {
        Principal principal = request.getUserPrincipal();
        String user = principal.getName();
        UserName manager = userNameReopsitory.findByUserName(user);

        String name = request.getParameter("month");
        if(name !=null || !name.isEmpty()) {
            String[] name1 = name.split("-");
            String month1 = name1[1] + "-" + name1[0];

            List<Proposition> month = propositionRepository.findAllByMonthAndLocation(month1, manager.getLocation());
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
            model.addAttribute("list", list);
            model.addAttribute("month", month);

            return "manager/salary2";
        } else return "manager/salary";
    }

    @ModelAttribute("location")
    List<Location> getLocation() {
        List<Location> locations = locationRepository.findAll();
        return locations;
    }

    public double hourDifference(String start, String finish) {
        double result = stringToHour(finish) - stringToHour(start);
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
