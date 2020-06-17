package beans;

public class Utilisateur {
	private int idU;
	private String nom;
	private String prenom;
	private String ddn;
	private long ndt; 
	private String email;
	private String id;
	private int idR;
	private String matricule;
	@Override
	public String toString() {
		return "Utilisateur [idU=" + idU + ", nom=" + nom + ", prenom=" + prenom + ", ddn=" + ddn + ", ndt=" + ndt
				+ ", email=" + email + ", id=" + id + ", idR=" + idR + ", matricule=" + matricule + ", admin=" + admin
				+ "]";
	}
	private boolean admin;
	
	public int getIdU() {
		return idU;
	}
	public void setIdU(int idU) {
		this.idU = idU;
	}
	public Utilisateur(int idU, String nom, String prenom, String ddn, long ndt, String email, String id, int idR,
			String matricule, boolean admin) {
		this.idU = idU;
		this.nom = nom;
		this.prenom = prenom;
		this.ddn = ddn;
		this.ndt = ndt;
		this.email = email;
		this.id = id;
		this.idR = idR;
		this.matricule = matricule;
		this.admin = admin;
	}
	public Utilisateur(Utilisateur u) {
		this.idU = u.idU;
		this.nom = u.nom;
		this.prenom = u.prenom;
		this.ddn = u.ddn;
		this.ndt = u.ndt;
		this.email = u.email;
		this.id = u.id;
		this.idR = u.idR;
		this.matricule = u.matricule;
		this.admin = u.admin;
	}
	public Utilisateur(String nom, String prenom, String ddn, long ndt, String email, String id, int idR,
			String matricule, boolean admin) {
		this.nom = nom;
		this.prenom = prenom;
		this.ddn = ddn;
		this.ndt = ndt;
		this.email = email;
		this.id = id;
		this.idR = idR;
		this.matricule = matricule;
		this.admin = admin;
	}
	public Utilisateur(String nom, String prenom, String ddn, long ndt, String email, String id, int idR,
			String matricule) {
		this.nom = nom;
		this.prenom = prenom;
		this.ddn = ddn;
		this.ndt = ndt;
		this.email = email;
		this.id = id;
		this.idR = idR;
		this.matricule = matricule;
	}
	public Utilisateur() {
		this.nom = "";
		this.prenom = "";
		this.ddn = "";
		this.ndt = 0;
		this.email = "";
	}
	
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getDdn() {
		return ddn;
	}
	public void setDdn(String ddn) {
		this.ddn = ddn;
	}
	public long getNdt() {
		return ndt;
	}
	public void setNdt(long ndt) {
		this.ndt = ndt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getidR() {
		return idR;
	}
	public void setidR(int idR) {
		this.idR = idR;
	}
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	

}
