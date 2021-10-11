package root.entidades;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Espectador;
import root.entidades.EstadoRegistro;
import root.entidades.Funcion;
import root.entidades.Registro;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Registro.class)
public class Registro_ { 

    public static volatile SingularAttribute<Registro, Date> fecha;
    public static volatile SingularAttribute<Registro, EstadoRegistro> estado;
    public static volatile SingularAttribute<Registro, Float> costo;
    public static volatile SingularAttribute<Registro, Espectador> espectador;
    public static volatile SingularAttribute<Registro, Long> id;
    public static volatile ListAttribute<Registro, Registro> canjeadoPor;
    public static volatile SingularAttribute<Registro, Funcion> funcion;

}