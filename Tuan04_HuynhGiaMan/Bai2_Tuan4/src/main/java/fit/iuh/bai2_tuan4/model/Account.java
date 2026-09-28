package fit.iuh.bai2_tuan4.model;

import java.sql.Date;

public class Account {
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private Date dateOfBirth;

    public Account() {
    }

    public Account(String firstname, String lastname, String email, String password, Date dateOfBirth) {

        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
    }

    public int getId() {
        return id;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
