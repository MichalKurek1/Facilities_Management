package pl.coderslab.arenaboot.model;

import javax.persistence.*;
import javax.validation.constraints.Pattern;


@Entity
@Table(name = "propositions")
public class Proposition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private UserName user;

    private String week;

    private double weekHours;

    private String pon;
    private String ponStart;
    private String ponEnd;
    private String ponStartFinal;
    private String ponEndFinal;

    private String wt;
    private String wtStart;
    private String wtEnd;
    private String wtStartFinal;
    private String wtEndFinal;

    private String sr;
    private String srStart;
    private String srEnd;
    private String srStartFinal;
    private String srEndFinal;

    private String czw;
    private String czwStart;
    private String czwEnd;
    private String czwStartFinal;
    private String czwEndFinal;

    private String pt;
    private String ptStart;
    private String ptEnd;
    private String ptStartFinal;
    private String ptEndFinal;

    private String sb;
    private String sbStart;
    private String sbEnd;
    private String sbStartFinal;
    private String sbEndFinal;

    private String nd;
    private String ndStart;
    private String ndEnd;
    private String ndStartFinal;
    private String ndEndFinal;

    public double getWeekHours() {
        return weekHours;
    }

    public void setWeekHours(double weekHours) {
        this.weekHours = weekHours;
    }

    public Proposition() {
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserName getUser() {
        return user;
    }

    public void setUser(UserName user) {
        this.user = user;
    }

    public String getPon() {
        return pon;
    }

    public void setPon(String pon) {
        this.pon = pon;
    }

    public String getPonStart() {
        return ponStart;
    }

    public void setPonStart(String ponStart) {
        this.ponStart = ponStart;
    }

    public String getPonEnd() {
        return ponEnd;
    }

    public void setPonEnd(String ponEnd) {
        this.ponEnd = ponEnd;
    }

    public String getWt() {
        return wt;
    }

    public void setWt(String wt) {
        this.wt = wt;
    }

    public String getWtStart() {
        return wtStart;
    }

    public void setWtStart(String wtStart) {
        this.wtStart = wtStart;
    }

    public String getWtEnd() {
        return wtEnd;
    }

    public void setWtEnd(String wtEnd) {
        this.wtEnd = wtEnd;
    }

    public String getSr() {
        return sr;
    }

    public void setSr(String sr) {
        this.sr = sr;
    }

    public String getSrStart() {
        return srStart;
    }

    public void setSrStart(String srStart) {
        this.srStart = srStart;
    }

    public String getSrEnd() {
        return srEnd;
    }

    public void setSrEnd(String srEnd) {
        this.srEnd = srEnd;
    }

    public String getCzw() {
        return czw;
    }

    public void setCzw(String czw) {
        this.czw = czw;
    }

    public String getCzwStart() {
        return czwStart;
    }

    public void setCzwStart(String czwStart) {
        this.czwStart = czwStart;
    }

    public String getCzwEnd() {
        return czwEnd;
    }

    public void setCzwEnd(String czwEnd) {
        this.czwEnd = czwEnd;
    }

    public String getPt() {
        return pt;
    }

    public void setPt(String pt) {
        this.pt = pt;
    }

    public String getPtStart() {
        return ptStart;
    }

    public void setPtStart(String ptStart) {
        this.ptStart = ptStart;
    }

    public String getPtEnd() {
        return ptEnd;
    }

    public void setPtEnd(String ptEnd) {
        this.ptEnd = ptEnd;
    }

    public String getSb() {
        return sb;
    }

    public void setSb(String sb) {
        this.sb = sb;
    }

    public String getSbStart() {
        return sbStart;
    }

    public void setSbStart(String sbStart) {
        this.sbStart = sbStart;
    }

    public String getSbEnd() {
        return sbEnd;
    }

    public void setSbEnd(String sbEnd) {
        this.sbEnd = sbEnd;
    }

    public String getNd() {
        return nd;
    }

    public void setNd(String nd) {
        this.nd = nd;
    }

    public String getNdStart() {
        return ndStart;
    }

    public void setNdStart(String ndStart) {
        this.ndStart = ndStart;
    }

    public String getNdEnd() {
        return ndEnd;
    }

    public void setNdEnd(String ndEnd) {
        this.ndEnd = ndEnd;
    }

    public String getPonStartFinal() {
        return ponStartFinal;
    }

    public void setPonStartFinal(String ponStartFinal) {
        this.ponStartFinal = ponStartFinal;
    }

    public String getPonEndFinal() {
        return ponEndFinal;
    }

    public void setPonEndFinal(String ponEndFinal) {
        this.ponEndFinal = ponEndFinal;
    }

    public String getWtStartFinal() {
        return wtStartFinal;
    }

    public void setWtStartFinal(String wtStartFinal) {
        this.wtStartFinal = wtStartFinal;
    }

    public String getWtEndFinal() {
        return wtEndFinal;
    }

    public void setWtEndFinal(String wtEndFinal) {
        this.wtEndFinal = wtEndFinal;
    }

    public String getSrStartFinal() {
        return srStartFinal;
    }

    public void setSrStartFinal(String srStartFinal) {
        this.srStartFinal = srStartFinal;
    }

    public String getSrEndFinal() {
        return srEndFinal;
    }

    public void setSrEndFinal(String srEndFinal) {
        this.srEndFinal = srEndFinal;
    }

    public String getCzwStartFinal() {
        return czwStartFinal;
    }

    public void setCzwStartFinal(String czwStartFinal) {
        this.czwStartFinal = czwStartFinal;
    }

    public String getCzwEndFinal() {
        return czwEndFinal;
    }

    public void setCzwEndFinal(String czwEndFinal) {
        this.czwEndFinal = czwEndFinal;
    }

    public String getPtStartFinal() {
        return ptStartFinal;
    }

    public void setPtStartFinal(String ptStartFinal) {
        this.ptStartFinal = ptStartFinal;
    }

    public String getPtEndFinal() {
        return ptEndFinal;
    }

    public void setPtEndFinal(String ptEndFinal) {
        this.ptEndFinal = ptEndFinal;
    }

    public String getSbStartFinal() {
        return sbStartFinal;
    }

    public void setSbStartFinal(String sbStartFinal) {
        this.sbStartFinal = sbStartFinal;
    }

    public String getSbEndFinal() {
        return sbEndFinal;
    }

    public void setSbEndFinal(String sbEndFinal) {
        this.sbEndFinal = sbEndFinal;
    }

    public String getNdStartFinal() {
        return ndStartFinal;
    }

    public void setNdStartFinal(String ndStartFinal) {
        this.ndStartFinal = ndStartFinal;
    }

    public String getNdEndFinal() {
        return ndEndFinal;
    }

    public void setNdEndFinal(String ndEndFinal) {
        this.ndEndFinal = ndEndFinal;
    }
}
