package root.entidades;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Espectaculo;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Plataforma.class)
public class Plataforma_ { 

    public static volatile SingularAttribute<Plataforma, String> descripcion;
    public static volatile SingularAttribute<Plataforma, String> imagen;
    public static volatile ListAttribute<Plataforma, Espectaculo> espectaculos;
    public static volatile SingularAttribute<Plataforma, Long> id;
    public static volatile SingularAttribute<Plataforma, String> nombre;
    public static volatile SingularAttribute<Plataforma, String> url;

}