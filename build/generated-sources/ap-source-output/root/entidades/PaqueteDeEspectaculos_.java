package root.entidades;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Compra;
import root.entidades.Espectaculo;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(PaqueteDeEspectaculos.class)
public class PaqueteDeEspectaculos_ { 

    public static volatile SingularAttribute<PaqueteDeEspectaculos, String> descripcion;
    public static volatile ListAttribute<PaqueteDeEspectaculos, Compra> compras;
    public static volatile SingularAttribute<PaqueteDeEspectaculos, Date> fechaAlta;
    public static volatile SingularAttribute<PaqueteDeEspectaculos, Date> fechaInicio;
    public static volatile SingularAttribute<PaqueteDeEspectaculos, Float> descuento;
    public static volatile SingularAttribute<PaqueteDeEspectaculos, String> imagen;
    public static volatile ListAttribute<PaqueteDeEspectaculos, Espectaculo> espectaculos;
    public static volatile SingularAttribute<PaqueteDeEspectaculos, Long> id;
    public static volatile SingularAttribute<PaqueteDeEspectaculos, String> nombre;
    public static volatile SingularAttribute<PaqueteDeEspectaculos, Date> fechaFin;

}