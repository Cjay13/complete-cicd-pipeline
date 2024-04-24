package com.cjay.ecom.userManagement.user;

import com.cjay.ecom.userManagement.addressInfo.Address;
import com.cjay.ecom.userManagement.addressInfo.AddressRepository;
//import com.cjay.ecom.userManagement.paymentMethod.PaymentMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;

    //private final AddressRepository addressRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getUsers() {
        return userRepository.findAll();

    }

    @Transactional
    public User addUsers(User user) {
        Optional<User> userByEmail = userRepository.findUserByEmail(user.getEmail());
        if (userByEmail.isPresent()) {
            throw new IllegalStateException("email already associated with an existing user");
        }

        else {
            List<Address> addresses = user.getAddress();
            if (addresses != null) {
                for (Address address : addresses) {
                    address.setUser(user);
                }
            }

            userRepository.save(user);
            return user;


        }
    }
}
