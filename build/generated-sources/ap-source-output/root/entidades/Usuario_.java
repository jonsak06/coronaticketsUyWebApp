package root.entidades;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import root.entidades.Usuario;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-09-27T08:54:13")
@StaticMetamodel(Usuario.class)
public abstract class Usuario_ { 

    public static volatile ListAttribute<Usuario, Usuario> siguiendo;
    public static volatile SingularAttribute<Usuario, String> passwd;
    public static volatile SingularAttribute<Usuario, Date> fechaNacimiento;
    public static volatile SingularAttribute<Usuario, String> apellido;
    public static volatile SingularAttribute<Usuario, String> correo;
    public static volatile SingularAttribute<Usuario, String> nickname;
    public static volatile SingularAttribute<Usuario, String> imagen;
    public static volatile SingularAttribute<Usuario, Long> id;
    public static volatile ListAttribute<Usuario, Usuario> seguidores;
    public static volatile SingularAttribute<Usuario, String> nombre;

}