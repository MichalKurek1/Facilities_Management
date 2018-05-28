package pl.coderslab.arenaboot.model;

import java.util.ArrayList;
import java.util.List;

public class PropositionList {

    private List<Proposition> propositionList = new ArrayList<>();

    public PropositionList(){

    }

    public PropositionList(List<Proposition> proposition1) {
            for(Proposition prop: proposition1){
                propositionList.add(prop);
            }
    }

    public List<Proposition> getPropositionList() {
        return propositionList;
    }

    public void setPropositionList(List<Proposition> proposition) {
        this.propositionList = proposition;
    }


}
