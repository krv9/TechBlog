package com.techblog.entities;

import java.sql.Timestamp;

public class user {
	
private static int User_ID;
private static String Name;
private static String Email;
private static String Gender;
private static String Password;
private static String About;
private static Timestamp Date;
private static String profile;

//Constructor for all fields

public static String getProfile() {
	return profile;
}

public static void setProfile(String profile) {
	user.profile = profile;
}

public user(int user_ID, String name, String email, String gender, String password, String about) {
	super();
	User_ID = user_ID;
	Name = name;
	Email = email;
	Gender = gender;
	Password = password;
	About = about;
}

//Default constructor

public user() {

}

//constructor without ID

public user(String name, String email, String gender, String password, String about) {
	Name = name;
	Email = email;
	Gender = gender;
	Password = password;
	About = about;
}
//Getter & Setter for fields

public static int getUser_ID() {
	return User_ID;
}

public void setUser_ID(int user_ID) {
	User_ID = user_ID;
}

public String getName() {
	return Name;
}

public static void setName(String name) {
	Name = name;
}

public  String getEmail() {
	return Email;
}

public static void setEmail(String email) {
	Email = email;
}

public  String getGender() {
	return Gender;
}

public static void setGender(String gender) {
	Gender = gender;
}

public  String getPassword() {
	return Password;
}

public static void setPassword(String password) {
	Password = password;
}

public  String getAbout() {
	return About;
}

public static void setAbout(String about) {
	About = about;
}

public static Timestamp getDate() {
	return Date;
}

public static void setDate(Timestamp date) {
	Date = date;
}


}
