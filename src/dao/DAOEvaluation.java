package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Evaluation;
import beans.SqlData;

public class DAOEvaluation {
public static Evaluation getEvalusationByid(int idUevaluateur,int idU)
{
	Evaluation e=null;
	SqlData.connection();
	ResultSet rs=SqlData.selectQuery("select * from evaluations where idUevaluateur="+idUevaluateur+" and idU="+idU+";");
	try {
		if(rs.next())
			e=new Evaluation(rs.getInt("idE"), rs.getBoolean("evaluationU"),rs.getInt("idUevaluateur"),rs.getInt("idU"));
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	SqlData.disconection();
	return e;
}
public static void insertEvaluation(Evaluation e)
{
	SqlData.connection();
	SqlData.miseAJour("insert into evaluations (evaluationU,idUevaluateur,idU) values ("+e.isEvaluation()+","+e.getIdUevaluateur()+","+e.getIdU()+");");
	SqlData.disconection();
}
public static void updateEvaluation(Evaluation e)
{
	SqlData.connection();
	SqlData.miseAJour("update evaluations set evaluationU="+e.isEvaluation()+" where idUevaluateur="+e.getIdUevaluateur()+" and idU="+e.getIdU()+";");
	SqlData.disconection();
}
public static int countLike(int id)
{
	SqlData.connection();
	int i=0;
	ResultSet rs=SqlData.selectQuery("select count(*) from evaluations where idU="+id+" and evaluationU=1");
	try {
		if(rs.next())
		{
			i=rs.getInt(1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	SqlData.disconection();
	return i;
}
public static int countDislike(int id)
{
	SqlData.connection();
	int i=0;
	ResultSet rs=SqlData.selectQuery("select count(*) from evaluations where idU="+id+" and evaluationU=0");
	try {
		if(rs.next())
		{
			i=rs.getInt(1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	SqlData.disconection();
	return i;
}

}
