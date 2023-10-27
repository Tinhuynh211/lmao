/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author PC
 */
public class User {
    
    private int userId;
    private String avatarUrl;
    private String username; // 1
    private String password; // 2
    private String name;
    private String email;    // 3
    private String phone;    // 4 
    private boolean gender;
    private String role;
    private LocalDateTime expiredTime;
    private int coinQuantity;
    private LocalDateTime createAt;

    public User() {
    }
    
    public User(int userId, String avatarUrl, String username) {
        this.userId = userId;
        this.avatarUrl = avatarUrl;
        this.username = username;
    }

    public User(int userId, String avatarUrl, String username, String password, String name, String email, String phone, boolean gender, String role, LocalDateTime expiredTime, int coinQuantity, LocalDateTime createAt) {
        this.userId = userId;
        this.avatarUrl = avatarUrl;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.role = role;
        this.expiredTime = expiredTime;
        this.coinQuantity = coinQuantity;
        this.createAt = createAt;
    }

    
    public User(String avatarUrl, String username, String password, String name, String email, String phone, boolean gender, String role, LocalDateTime expiredTime, int coinQuantity, LocalDateTime createAt) {
        this.avatarUrl = avatarUrl;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.role = role;
        this.expiredTime = expiredTime;
        this.coinQuantity = coinQuantity;
        this.createAt = createAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

  
    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        if (gender) {
            return "Male";
        } else {
            return "Female";
        }
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDateTime getExpiredTime() {
        return expiredTime;
    }

    public String getExpiredTimeFormat() {
        return expiredTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public void setExpiredTime(LocalDateTime expiredTime) {
        this.expiredTime = expiredTime;
    }

    public int getCoinQuantity() {
        return coinQuantity;
    }

    public void setCoinQuantity(int coinQuantity) {
        this.coinQuantity = coinQuantity;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public String getCreateAtFormat() {
        return createAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", avatarUrl=" + avatarUrl + ", username=" + username + ", password=" + password + ", name=" + name + ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", role=" + role + ", expiredTime=" + expiredTime + ", coinQuantity=" + coinQuantity + ", createAt=" + createAt + '}';
    }

    
}
