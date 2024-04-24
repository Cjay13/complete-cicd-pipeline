package com.cjay.ecom.userManagement.addressInfo;

import com.cjay.ecom.userManagement.user.User;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Address {
    public enum AddressType {
        BILLING_ADDRESS(0),
        SHIPPING_ADDRESS(1);

        private final int value;

        AddressType(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }

        public static AddressType fromValue(int value) {
            for (AddressType type : AddressType.values()) {
                if (type.getValue() == value) {
                    return type;
                }
            }
            throw new IllegalArgumentException("Invalid AddressType value: " + value);
        }


    }

    @Id
    @SequenceGenerator(
            name = "address_seq_gen",
            sequenceName = "address_seq_gen",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "address_seq_gen"
    )
    private long id;

    @Enumerated(EnumType.ORDINAL)
    private AddressType addressType;

    private String homeNo;

    private String street1;

    private String street2;

    private String city;

    private String state;

    private String zipCode;

    private String country;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference // Prevents infinite recursion
    private User user;

}

