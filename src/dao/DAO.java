package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.Authentification;
import beans.Cartiers;
import beans.Reservation;
import beans.SqlData;
import beans.Trajet;
import beans.Utilisateur;
import beans.Vehicule;

public class DAO {
	// authentification
	public static Authentification connexion(Authentification user) throws SQLException {
		SqlData.connection();
		Authentification u = null;
		ResultSet rs = SqlData.selectQuery("select * from authentification where lower(login)=lower('" + user.getLogin()
				+ "') and lower(password)=lower('" + user.getPassword() + "');");
		try {
			if (rs.next() == false)
				SqlData.disconection();
			else {
				u = new Authentification(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
				SqlData.disconection();
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return u;

	}

	public static Authentification connexion(String login, String password) {
		SqlData.connection();
		Authentification u = null;
		ResultSet rs = SqlData.selectQuery("select * from authentification where lower(login)=lower('" + login
				+ "') and lower(password)=lower('" + password + "');");

		try {
			if (rs.next() == false)
				SqlData.disconection();
			else {
				u = new Authentification(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
				SqlData.disconection();
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return u;
	}

	public static Utilisateur getUserByRFID(String id) {
		SqlData.connection();
		Utilisateur u = null;
		ResultSet rs = SqlData.selectQuery("select * from utilisateurs where lower(id)=lower('" + id + "');");
		try {
			if (rs.next()) {
				u = new Utilisateur(rs.getInt("idU"), rs.getString("nom"), rs.getString("prenom"), rs.getString("ddn"),
						rs.getLong("ndt"), rs.getString("email"), rs.getString("id"), rs.getInt("idR"),
						rs.getString("matricule"), rs.getBoolean("admin"));
				SqlData.disconection();
			} else
				SqlData.disconection();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return u;
	}

	public static void creeUtilisateur(Utilisateur u) {
		SqlData.connection();
		SqlData.miseAJour("insert into utilisateurs (nom,prenom,ddn,ndt,email,id,idR,matricule) values ('" + u.getNom()
				+ "','" + u.getPrenom() + "',STR_TO_DATE('" + u.getDdn() + "','%d-%m-%Y')," + u.getNdt() + ",'"
				+ u.getEmail() + "','" + u.getId() + "'," + u.getidR() + ",'" + u.getMatricule() + "')");
		SqlData.disconection();
	}

	public static void updateAuthentification(String id, String login, String password) {
		SqlData.connection();
		SqlData.miseAJour(
				"update authentification set login='" + login + "',password='" + password + "' where id='" + id + "';");
		SqlData.disconection();
	}

	public static void updateAuthentification(Authentification a) {
		SqlData.connection();
		SqlData.miseAJour("update authentification set login='" + a.getLogin() + "',password='" + a.getPassword()
				+ "' where id='" + a.getId() + "';");
		SqlData.disconection();
	}

	public static void creeVehicule(Vehicule v) {
		SqlData.connection();
		SqlData.miseAJour("insert into vehicules (matricule,marque,ndp) values ('" + v.getMatricule() + "','"
				+ v.getMarque() + "'," + v.getNdp() + ")");
		SqlData.disconection();
	}

	public static void creeVehicule(String matricule, String marque, int ndp) {
		SqlData.connection();
		SqlData.miseAJour("insert into vehicules (matricule,marque,ndp) values ('" + matricule + "','" + marque + "',"
				+ ndp + ")");
		SqlData.disconection();
	}

	public static boolean usedId(String id) {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from authentification where lower(id)=lower('" + id + "');");
		String login = null;

		try {
			rs.next();
			login = rs.getString("login");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		if (login.equalsIgnoreCase("**")) {
			SqlData.disconection();
			return false;
		} else {
			SqlData.disconection();
			return true;
		}
	}

	public static boolean existId(String id) {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from authentification where lower(id)=lower('" + id + "');");
		try {
			if (rs.next()) {
				SqlData.disconection();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return false;
	}

	public static List<String> toutLesRegion() {
		List<String> regions = new ArrayList<>();
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select nomR from regions");
		try {
			while (rs.next()) {
				regions.add(rs.getString("nomR"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return regions;
	}

	public static int creeCartier(String nomC, int idR) {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * where lower(nomC)=lower('" + nomC + "')and idR=" + idR + ";");
		int i = -1;
		try {
			if (!rs.next()) {
				rs.close();
				SqlData.miseAJour("insert into cartiers (nomC,idR) values ('" + nomC + "'," + idR + ")");
				rs = SqlData.selectQuery("select * where lower(nomC)=lower('" + nomC + "')and idR=" + idR + ";");
				rs.next();
				i = rs.getInt("idC");
			} else {
				i = rs.getInt("idC");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		SqlData.disconection();
		return i;
	}

	public static int creeCartier(Cartiers c) {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery(
				"select * from cartiers where lower(nomC)=lower('" + c.getNomC() + "') and idR=" + c.getIdR() + ";");
		int i = -1;
		try {
			if (!rs.next()) {
				rs.close();
				SqlData.miseAJour("insert into cartiers (nomC,idR) values ('" + c.getNomC() + "'," + c.getIdR() + ")");
				rs = SqlData.selectQuery("select * from cartiers where lower(nomC)=lower('" + c.getNomC()
						+ "') and idR=" + c.getIdR() + ";");
				rs.next();
				i = rs.getInt("idC");
			} else {
				i = rs.getInt("idC");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		SqlData.disconection();
		return i;
	}

	public static boolean existLogin(String login) {
		boolean b = false;
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from authentification where lower(login)=lower('" + login + "')");
		try {
			if (rs.next())
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return b;
	}

	public static boolean existMatricule(String matricule) {
		boolean b = false;
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from vehicules where lower(matricule)=lower('" + matricule + "')");
		try {
			if (rs.next())
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return b;
	}

	public static boolean existEmail(String email) {
		boolean b = false;
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from utilisateurs where lower(email)=lower('" + email + "')");
		try {
			if (rs.next())
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return b;
	}

	public static boolean existndt(long ndt) {
		boolean b = false;
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from utilisateurs where ndt=" + ndt + ";");
		try {
			if (rs.next())
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return b;
	}

	public static Vehicule getVehicule(String matricule) {
		SqlData.connection();
		ResultSet rs = SqlData
				.selectQuery("select * from vehicules where lower(matricule)=lower('" + matricule + "');");
		Vehicule v = null;

		try {
			rs.next();
			v = new Vehicule(rs.getString("matricule"), rs.getString("marque"), rs.getInt("ndp"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}

	public static void creeTraget(Trajet t) {
		SqlData.connection();
		SqlData.miseAJour(
				"insert into trajets (bagageAutorise,prix,dateDepart,idCreateur,idCartierDepart,idCartierArrive) values ("
						+ t.isBagageAutorise() + "," + t.getPrix() + ",STR_TO_DATE('" + t.getDateDepart()
						+ "','%d-%m-%Y')," + t.getIdCreateur() + "," + t.getIdCartierDepart() + ","
						+ t.getIdCartierArrive() + ");");
		SqlData.disconection();
	}

	public static List<Trajet> rechercherTrajets(int idDepart, int idArrive) {
		SqlData.connection();
		ResultSet rs = SqlData
				.selectQuery("select * from trajets where idCartierDepart in (select idC from cartiers where idR="
						+ idDepart + ") and idCartierArrive in (select idC from cartiers where idR=" + idArrive
						+ ") order by dateDepart;");
		List<Trajet> t = new ArrayList<Trajet>();
		try {
			while (rs.next())
				t.add(new Trajet(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8)));
		} catch (SQLException e) {
			System.out.println("erreur rechercher trajet");
			e.printStackTrace();
		}
		SqlData.disconection();
		return t;
	}

	public static List<Trajet> allTrajet() {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from trajets order by dateDepart;");
		List<Trajet> t = new ArrayList<Trajet>();
		try {
			while (rs.next())
				t.add(new Trajet(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8)));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return t;
	}

	public static String getRegionByCartier(int idC) {
		SqlData.connection();
		ResultSet rs = SqlData
				.selectQuery("select nomR from regions where idR in (select idR from cartiers where idC=" + idC + ")");
		String s;
		try {
			rs.next();
			s = rs.getString("nomR");
		} catch (SQLException e) {
			s = null;
			e.printStackTrace();
		}

		SqlData.disconection();
		return s;
	}

	public static String getUtilisateur(int id) {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select nom,prenom from utilisateurs where idU=" + id + ";");
		String s;
		String p = null;
		try {
			rs.next();
			s = rs.getString("nom");
			p = rs.getString("prenom");
		} catch (SQLException e) {
			s = null;
			e.printStackTrace();
		}

		SqlData.disconection();
		return s + " " + p;
	}

	public static Trajet getTrajetById(int id) {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from trajets where idT=" + id + ";");
		Trajet t = null;
		try {
			rs.next();
			t = new Trajet(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getInt(4), rs.getString(5), rs.getInt(6),
					rs.getInt(7), rs.getInt(8));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		SqlData.disconection();
		return t;
	}

	public static String getCartierName(int id) {
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select nomC from cartiers where idC=" + id + ";");
		String s;
		try {
			rs.next();
			s = rs.getString("nomC");
		} catch (SQLException e) {
			s = null;
			e.printStackTrace();
		}

		SqlData.disconection();
		return s;
	}

	public static void creeReservation(Reservation r) {
		SqlData.connection();
		SqlData.miseAJour("insert into reservations (idT,idU) values (" + r.getIdT() + "," + r.getIdU() + ");");
		SqlData.disconection();
	}

	public static Vehicule getVehiculeByIdU(int idU) {
		// cette fonction est utilisé pour savoir la voiture d'un constructeur
		SqlData.connection();
		ResultSet rs = SqlData
				.selectQuery("select * from vehicules where matricule in (select matricule from utilisateurs where idU="
						+ idU + ");");
		Vehicule t = null;
		try {
			rs.next();
			t = new Vehicule(rs.getString(1), rs.getString(2), rs.getInt(3));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return t;
	}

	public static int nbrDePassager(int idT) {
		int i = 0;
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select count(*) from reservations where idT=" + idT + " and etat=1;");
		try {
			rs.next();
			i = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SqlData.disconection();
		return i;
	}

	public static List<Reservation> getReservationByCreator(int idU) {
		List<Reservation> l = new ArrayList<>();
		SqlData.connection();
		ResultSet rs = SqlData.selectQuery("select * from reservations where idU=" + idU + " order by idT;");
		try {
			while (rs.next()) {
				l.add(new Reservation(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		SqlData.disconection();
		return l;
	}

	public static List<Reservation> getReservationByTrajetCreator(int idU) {
		List<Reservation> l = new ArrayList<>();
		SqlData.connection();
		ResultSet rs = SqlData
				.selectQuery("select * from reservations where idT in (select idT from trajets where idCreateur=" + idU
						+ ") order by idT;");
		try {
			while (rs.next()) {
				l.add(new Reservation(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		SqlData.disconection();
		return l;
	}

	public static void updateEtatReservation(int idR, int etat) {
		SqlData.connection();
		SqlData.miseAJour("update reservations set etat=" + etat + " where idR=" + idR + ";");
		SqlData.disconection();
	}

	public static boolean isInTrajet(int idT, int idU) {
		SqlData.connection();
		boolean b = false;
		ResultSet rs = SqlData.selectQuery("select * from reservations where idU=" + idU + " and idT=" + idT + ";");
		try {
			b = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlData.disconection();
		return b;
	}

	public static void deleteReservation(int idR) {
		SqlData.connection();
		SqlData.miseAJour("DELETE FROM reservations WHERE idR=" + idR + ";");
		SqlData.disconection();
	}
}
