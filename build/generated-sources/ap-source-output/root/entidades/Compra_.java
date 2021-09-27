package root.entidades;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Espectador;
import root.entidades.PaqueteDeEspectaculos;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Compra.class)
public class Compra_ { 

    public static volatile SingularAttribute<Compra, Date> fecha;
    public static volatile SingularAttribute<Compra, Espectador> espectador;
    public static volatile SingularAttribute<Compra, Long> id;
    public static volatile SingularAttribute<Compra, PaqueteDeEspectaculos> paquete;

}