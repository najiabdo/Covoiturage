package beans;

public class Evaluation {
int idE;
boolean evaluation;
int idUevaluateur;
int idU;
public int getIdE() {
	return idE;
}
public void setIdE(int idE) {
	this.idE = idE;
}
public boolean isEvaluation() {
	return evaluation;
}
public void setEvaluation(boolean evaluation) {
	this.evaluation = evaluation;
}
public int getIdUevaluateur() {
	return idUevaluateur;
}
public void setIdUevaluateur(int idUevaluateur) {
	this.idUevaluateur = idUevaluateur;
}
public int getIdU() {
	return idU;
}
public void setIdU(int idU) {
	this.idU = idU;
}
public Evaluation(int idE, boolean evaluation, int idUevaluateur, int idU) {
	this.idE = idE;
	this.evaluation = evaluation;
	this.idUevaluateur = idUevaluateur;
	this.idU = idU;
}
public Evaluation(boolean evaluation, int idUevaluateur, int idU) {//1 like 0 dislike
	this.evaluation = evaluation;
	this.idUevaluateur = idUevaluateur;
	this.idU = idU;
}
}
