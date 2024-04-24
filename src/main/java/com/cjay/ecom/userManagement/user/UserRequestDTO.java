package com.cjay.ecom.userManagement.user;

import com.cjay.ecom.userManagement.addressInfo.Address;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRequestDTO {
    private String name;
    private String userName;
    private String email;
    private List<Address> addresses;

}
