<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/11/2023
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="p-3 mb-3 border-bottom">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/customer" class="nav-link px-2 link-dark">Customers</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Products</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Orders</a></li>
      </ul>
      <div class="dropdown text-end">
        <a href="#" class="dropdown__login d-block link-dark text-decoration-none dropdown-toggle d-flex" id="dropdownUser"data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          <p style="padding: 4px">Admin</p>
        </a>
        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser" >
          <li><a class="dropdown-item" href="#">Sign out</a></li>
        </ul>
      </div>
    </div>
  </div>
</header>