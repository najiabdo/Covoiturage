package beans;

public class Authentification {
 private String login;
 private String password;
 private boolean etat;
 private String id;
 
public String getLogin() {
	return login;
}
public void setLogin(String login) {
	this.login = login;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public boolean getEtat() {
	return etat;
}
public void setEtat(boolean etat) {
	this.etat = etat;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public Authentification(String id, String password,String login, boolean etat) {
	this.login = login;
	this.password = password;
	this.etat = etat;
	this.id = id;
}
public Authentification(String id, String password,String login) {
	super();
	this.login = login;
	this.password = password;
	this.etat = false;
	this.id = id;
}
public Authentification() {
	super();
	this.login = "";
	this.password = "";
}
@Override
public String toString() {
	return "Authentification login=" + login + ", password=" + password + ", etat=" + etat + ", id=" + id + "";
}

 
}
