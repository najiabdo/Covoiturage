package beans;

public class Reservation {
@Override
	public String toString() {
		return "Reservation [idR=" + idR + ", ddReservation=" + ddReservation + ", idU=" + idU + ", idT=" + idT
				+ ", etat=" + etat + "]";
	}
private int idR;
private String ddReservation;
private int idU;
private int idT;
private int etat;
public String getDdReservation() {
	return ddReservation;
}
public void setDdReservation(String ddReservation) {
	this.ddReservation = ddReservation;
}
public int getIdU() {
	return idU;
}
public void setIdU(int idU) {
	this.idU = idU;
}
public int getIdT() {
	return idT;
}
public void setIdT(int idT) {
	this.idT = idT;
}
public int getEtat() {
	return etat;
}
public void setEtat(int etat) {
	this.etat = etat;
}
public Reservation(int idR,String ddReservation, int idU, int idT, int etat) {
	super();
	this.idR=idR;
	this.ddReservation = ddReservation;
	this.idU = idU;
	this.idT = idT;
	this.etat = etat;
}
public int getIdR() {
	return idR;
}
public void setIdR(int idR) {
	this.idR = idR;
}
public Reservation(String ddReservation, int idU, int idT, int etat) {
	super();
	this.ddReservation = ddReservation;
	this.idU = idU;
	this.idT = idT;
	this.etat = etat;
}
public Reservation(int idU, int idT) {
	super();
	this.idU = idU;
	this.idT = idT;
}

}
