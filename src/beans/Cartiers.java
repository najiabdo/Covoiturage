package beans;

public class Cartiers {
private int idC;
private String nomC;
private int idR;

public int getIdC() {
	return idC;
}
public void setIdC(int idC) {
	this.idC = idC;
}
public String getNomC() {
	return nomC;
}
public void setNomC(String nomC) {
	this.nomC = nomC;
}
public int getIdR() {
	return idR;
}
public void setIdR(int idR) {
	this.idR = idR;
}
public Cartiers( String nomC, int idR) {
	this.nomC = nomC;
	this.idR = idR;
}
public Cartiers(int idC, String nomC, int idR) {
	this.idC = idC;
	this.nomC = nomC;
	this.idR = idR;
}

}
