/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ultils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author PC
 */
public class EncryptPassword {

    public String toSHA1(String password) {
        String code = "MangaUniverse";
        String encryptedPassword = null;

        try {

            password = password + code;

            byte[] dataBytes = password.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");

            encryptedPassword = Base64.encodeBase64String(md.digest(dataBytes));

        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(EncryptPassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(EncryptPassword.class.getName()).log(Level.SEVERE, null, ex);
        }

        return encryptedPassword;
    }
}
