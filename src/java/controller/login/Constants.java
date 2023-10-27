/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.login;

/**
 *
 * @author PC
 */
public class Constants {
    /*--------------------- GOOGLE ---------------------*/

    // enter your client key
    public static String GOOGLE_CLIENT_ID = "727306614937-6mj4mhufjq06aqns6el83e2fnegocjbn.apps.googleusercontent.com";

    // enter your secret key
    public static String GOOGLE_CLIENT_SECRET = "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";

    // enter your redirect uri (if no, error 400) -> for Login page
    public static String GOOGLE_REDIRECT_URI_LOGIN = "http://localhost:8080/MangaUniverse/LoginGoogleServlet";
    // enter your redirect uri (if no, error 400) -> for Register page
    public static String GOOGLE_REDIRECT_URI_REGISTER = "http://localhost:8080/MangaUniverse/RegisterGoogleServlet";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
//    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/plus/v1/people/me?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    
    /*--------------------- FACEBOOK ---------------------*/

    public static String FACEBOOK_APP_ID = "359123991240252";
    public static String FACEBOOK_APP_SECRET = "d07e182d8495df6930665d6c39fbe8ac";
    public static String FACEBOOK_REDIRECT_URL = "https://localhost:8443/AccessFacebook/login-facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

}
