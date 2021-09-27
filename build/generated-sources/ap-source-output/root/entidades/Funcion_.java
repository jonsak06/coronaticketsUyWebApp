package root.entidades;

import java.sql.Date;
import java.sql.Timestamp;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Artista;
import root.entidades.Espectaculo;
import root.entidades.Registro;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Funcion.class)
public class Funcion_ { 

    public static volatile SingularAttribute<Funcion, Date> fecha;
    public static volatile SingularAttribute<Funcion, Date> fechaDeRegistro;
    public static volatile SingularAttribute<Funcion, Espectaculo> espectaculo;
    public static volatile SingularAttribute<Funcion, String> imagen;
    public static volatile ListAttribute<Funcion, Registro> registros;
    public static volatile SingularAttribute<Funcion, Long> id;
    public static volatile ListAttribute<Funcion, Artista> artistasInvitados;
    public static volatile SingularAttribute<Funcion, String> nombre;
    public static volatile SingularAttribute<Funcion, Timestamp> horaInicio;

}