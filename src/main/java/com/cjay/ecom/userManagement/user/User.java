package com.cjay.ecom.userManagement.user;

import com.cjay.ecom.userManagement.addressInfo.Address;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class User {
    @Id
    @SequenceGenerator(
            name = "user_seq_generator",
            sequenceName = "user_seq_generator",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "user_seq_generator"
    )
    private long id;

    private String name;

    private String userName;

    private String email;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference // Prevents infinite recursion7
    private List<Address> address = new ArrayList<>();


    public User(String name, String userName, String email) {
        this.name = name;
        this.userName = userName;
        this.email = email;
    }

    public User(String name, String userName, String email, List<Address> address) {
        this.name = name;
        this.userName = userName;
        this.email = email;
        this.address = address;
    }
}
