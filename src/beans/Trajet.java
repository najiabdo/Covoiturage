package beans;

public class Trajet {
	private int idT;
	private String dateCreation;
	private boolean bagageAutorise;
	private int prix;
	private String dateDepart;
	private int idCreateur;
	private int idCartierDepart;
	private int idCartierArrive;
	
	public Trajet(int idT, String dateCreation, boolean bagageAutorise, int prix, String dateDepart, int idCreateur,
			int idCartierDepart, int idCartierArrive) {
		this.idT = idT;
		this.dateCreation = dateCreation;
		this.bagageAutorise = bagageAutorise;
		this.prix = prix;
		this.dateDepart = dateDepart;
		this.idCreateur = idCreateur;
		this.idCartierDepart = idCartierDepart;
		this.idCartierArrive = idCartierArrive;
	}
	public Trajet( boolean bagageAutorise, int prix, String dateDepart, int idCreateur,
			int idCartierDepart, int idCartierArrive) {
		this.bagageAutorise = bagageAutorise;
		this.prix = prix;
		this.dateDepart = dateDepart;
		this.idCreateur = idCreateur;
		this.idCartierDepart = idCartierDepart;
		this.idCartierArrive = idCartierArrive;
	}
	public Trajet(String dateCreation, boolean bagageAutorise, int prix, String dateDepart, int idCreateur,
			int idCartierDepart, int idCartierArrive) {
		this.dateCreation = dateCreation;
		this.bagageAutorise = bagageAutorise;
		this.prix = prix;
		this.dateDepart = dateDepart;
		this.idCreateur = idCreateur;
		this.idCartierDepart = idCartierDepart;
		this.idCartierArrive = idCartierArrive;
	}
	public Trajet(String dateCreation, boolean bagageAutorise, int prix, String dateDepart,
			int idCartierDepart, int idCartierArrive) {
		this.dateCreation = dateCreation;
		this.bagageAutorise = bagageAutorise;
		this.prix = prix;
		this.dateDepart = dateDepart;
		this.idCartierDepart = idCartierDepart;
		this.idCartierArrive = idCartierArrive;
	}
	public Trajet(int idT,String dateCreation, boolean bagageAutorise, int prix, String dateDepart,
			int idCartierDepart, int idCartierArrive) {
		this.dateCreation = dateCreation;
		this.bagageAutorise = bagageAutorise;
		this.prix = prix;
		this.dateDepart = dateDepart;
		this.idCartierDepart = idCartierDepart;
		this.idCartierArrive = idCartierArrive;
	}
	
	public Trajet() {
		this.dateCreation = "";
		this.bagageAutorise = false;
		this.prix = 0;
		this.dateDepart = "";
		this.idCreateur = 0;
		this.idCartierDepart = 0;
		this.idCartierArrive = 0;
	}
	@Override
	public String toString() {
		return "Trajet [idT=" + idT + ", dateCreation=" + dateCreation + ", bagageAutorise=" + bagageAutorise
				+ ", prix=" + prix + ", dateDepart=" + dateDepart + ", idCreateur=" + idCreateur + ", idCartierDepart="
				+ idCartierDepart + ", idCartierArrive=" + idCartierArrive + "]";
	}
	public int getIdT() {
		return idT;
	}
	public void setIdT(int idT) {
		this.idT = idT;
	}
	public String getDateCreation() {
		return dateCreation;
	}
	public void setDateCreation(String dateCreation) {
		this.dateCreation = dateCreation;
	}
	public boolean isBagageAutorise() {
		return bagageAutorise;
	}
	public void setBagageAutorise(boolean bagageAutorise) {
		this.bagageAutorise = bagageAutorise;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public String getDateDepart() {
		return dateDepart;
	}
	public void setDateDepart(String dateDepart) {
		this.dateDepart = dateDepart;
	}
	public int getIdCreateur() {
		return idCreateur;
	}
	public void setIdCreateur(int idCreateur) {
		this.idCreateur = idCreateur;
	}
	public int getIdCartierDepart() {
		return idCartierDepart;
	}
	public void setIdCartierDepart(int idCartierDepart) {
		this.idCartierDepart = idCartierDepart;
	}
	public int getIdCartierArrive() {
		return idCartierArrive;
	}
	public void setIdCartierArrive(int idCartierArrive) {
		this.idCartierArrive = idCartierArrive;
	}
	
	
	
}
