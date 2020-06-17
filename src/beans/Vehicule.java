package beans;

public class Vehicule {
@Override
	public String toString() {
		return "Vehicule [matricule=" + matricule + ", marque=" + marque + ", ndp=" + ndp + "]";
	}
private String matricule;
private String marque;
private int ndp;
public String getMatricule() {
	return matricule;
}
public void setMatricule(String matricule) {
	this.matricule = matricule;
}
public String getMarque() {
	return marque;
}
public void setMarque(String marque) {
	this.marque = marque;
}
public int getNdp() {
	return ndp;
}
public void setNdp(int ndp) {
	this.ndp = ndp;
}
public Vehicule(String matricule, String marque, int ndp) {
	super();
	this.matricule = matricule;
	this.marque = marque;
	this.ndp = ndp;
}
public Vehicule(Vehicule v) {
	super();
	this.matricule = v.matricule;
	this.marque = v.marque;
	this.ndp = v.ndp;
}
public Vehicule() {
	super();
}
}
