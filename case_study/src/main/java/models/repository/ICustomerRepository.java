package models.repository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICustomerRepository {
    boolean saveCustomer(HttpServletRequest request, HttpServletResponse response);
    boolean checkAccount(String userName, String password);

}
