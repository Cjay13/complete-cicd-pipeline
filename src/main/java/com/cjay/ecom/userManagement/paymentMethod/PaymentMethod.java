//package com.cjay.ecom.userManagement.paymentMethod;
//
//import com.cjay.ecom.userManagement.addressInfo.Address;
//import com.cjay.ecom.userManagement.user.User;
//import com.fasterxml.jackson.annotation.JsonBackReference;
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//import org.springframework.web.context.annotation.ApplicationScope;
//
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@Entity
//@Table
//public class PaymentMethod {
//    public enum PaymentType {
//        CREDIT_CARD(0),
//        DEBIT_CARD(1),
//        KOKO(2),
//        MINT_PAY(3);
//
//        private final int value;
//
//        PaymentType(int value) {
//            this.value = value;
//        }
//
//        public int getValue() {
//            return value;
//        }
//
//        public static PaymentType fromValue(int value) {
//            for (PaymentType type : PaymentType.values()) {
//                if (type.getValue() == value) {
//                    return type;
//                }
//            }
//            throw new IllegalArgumentException("Invalid PaymentType value: " + value);
//        }
//    }
//    @Id
//    @SequenceGenerator(
//            name = "pay_seq_gen",
//            sequenceName = "pay_seq_gen",
//            allocationSize = 1
//    )
//    @GeneratedValue(
//            strategy = GenerationType.SEQUENCE,
//            generator = "pay_seq_gen"
//    )
//    private long id;
//
//    @Enumerated(EnumType.ORDINAL)
//    private PaymentType type;
//
//    @ManyToOne
//    @JoinColumn(name = "user_id")
//    @JsonBackReference // Prevents infinite recursion
//    private User user;
//
//
//
//}
