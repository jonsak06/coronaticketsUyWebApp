import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
 
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
 
public class FtpUtil {
	    /**  
	     * Descripción: Subir archivos al servidor FTP  
	      * @param host servidor FTP nombre de host  
	      * @param port puerto del servidor FTP  
	      * @param nombre de usuario FTP cuenta de inicio de sesión  
	      * @param contraseña contraseña de inicio de sesión de FTP  
	      * @param basePath directorio base del servidor FTP 
	      * @param filePath Ruta de almacenamiento de archivos del servidor FTP. Por ejemplo, almacenamiento por fecha: / 2017/12/12. La ruta del archivo es basePath + filePath 
	      * @param filename El nombre del archivo cargado en el servidor FTP  
	      * @param entrada flujo de entrada  
	      * @return devuelve verdadero si tiene éxito, de lo contrario falso  
	     */    
	    public static boolean uploadFile(String host, int puerto, String username, String password, String basePath,  
	            String filePath, String filename, InputStream input) {  
	        boolean result = false;  
	        FTPClient ftp = new FTPClient();  
//	        ftp.setControlEncoding("UTF-8");
	        try {  
	            int reply;  
	             ftp.connect (host, puerto); // Conectarse al servidor FTP  
	             // Si usa el puerto predeterminado, puede usar ftp.connect (host) para conectarse directamente al servidor FTP  
	             ftp.login (username, password); // Iniciar sesión  
	            reply = ftp.getReplyCode();  
	            if (!FTPReply.isPositiveCompletion(reply)) {  
	                ftp.disconnect();  
	                return result;  
	            }  
	             // Cambiar al directorio de carga  
	            if (!ftp.changeWorkingDirectory(basePath+filePath)) {  
	                 // Si el directorio no existe, cree un directorio  
	                String[] dirs = filePath.split("/");  
	                String tempPath = basePath;  
	                for (String dir : dirs) {  
	                    if (null == dir || "".equals(dir)) continue;  
	                    tempPath += "/" + dir;  
	                    if (!ftp.changeWorkingDirectory(tempPath)) {  
	                        if (!ftp.makeDirectory(new String(tempPath.getBytes("UTF-8"),"iso-8859-1"))) {  
	                            return result;  
	                        } else {  
	                            ftp.changeWorkingDirectory(tempPath);  
	                        }  
	                    }  
	                }  
	            }  
	             // Establece el tipo de archivo cargado en tipo binario  
	            ftp.setFileType(FTP.BINARY_FILE_TYPE);  
	             	            //subir archivos     
	            ftp.enterLocalPassiveMode();
	            if (!ftp.storeFile(filename, input)) {
	                return result;  
	            }  
	            input.close();  
	            ftp.logout();  
	            result = true;  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        } finally {  
	            if (ftp.isConnected()) {  
	                try {  
	                    ftp.disconnect();  
	                } catch (IOException ioe) {  
	                }  
	            }  
	        }  
	        return result;  
            }	 
}