<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/12/2023
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap520/css/bootstrap.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/header_footer/header.jsp"></jsp:include>
<nav class="navbar navbar-light bg-light" style="position: sticky;top:0;left: 0;right: 0">
    <div class="container-fluid">
        <div style="display: flex; margin: 8px;position: relative">
            <div>
                <button type="button" class="btn btn-success btn-rounded"
                        onclick="window.location.href='/accessory?action=create'">New accessory
                </button>
            </div>
        </div>
        <p style="color: #31b131;font-weight: bolder;font-size: large">${mess}</p>
        <form action="/accessory?action=search" method="post" class="d-flex my-0">
            <input type="hidden" name="action" value="search">
            <input class="form-control me-2" type="text" placeholder="Enter name customer" aria-label="Search"
                   name="name">
            <select name="price" id="" class="form-select" aria-label="Default select example">
                <option value="1">choose price</option>
                <option value="2">Less than 100.000</option>
                <option value="3">From 100.000-500.000</option>
                <option value="4">From 500.000-1.000.000</option>
                <option value="5">Over 10.000.000</option>
            </select>
            <button class="btn btn-outline-primary" type="submit">Find</button>
        </form>
    </div>
</nav>



<div class="container-fluid my-lg-2">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
            <div>
                <h3>List customer</h3>
            </div>
            <table id="tableCustomer" class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Product ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Type</th>
                    <th scope="col" hidden>Describe</th>
                    <th scope="col">Price(VND)</th>
                    <th scope="col" hidden>Image</th>
                    <th scope="col">Create At</th>
                    <th scope="col">Update At</th>
                    <th scope="col">Manipulate</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productList}">
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td>
                        <c:if test="${product.getProductType() == 1}">
                            Phone
                        </c:if>
                        <c:if test="${product.getProductType() == 2}">
                            Accessory
                        </c:if>
                    </td>
                    <td hidden>${product.getDescribe()}</td>
                    <td>${product.getPrice()}</td>
                    <td hidden>${product.getProductImage()}</td>
                    <td>${product.getCreatAt()}</td>
                    <td>${product.getUpdateAt()}</td>
                    <td>
                        <button type="submit" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                onclick="deleteProduct('${product.getId()}','${product.getName()}')">
                            Delete
                        </button>
                        <button class="btn btn-warning"
                                onclick="window.location.href='/accessory?action=edit&id=${product.getId()}'">
                            Update
                        </button>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-1"></div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/accessory" method="post">
                <div class="modal-body">
                    <input type="text" name="action" value="delete" hidden>
                    <input type="text" id="id" name="id" hidden>
                    Do you want to delete the product <span id="name"></span> ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">
                        Yes
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function deleteProduct(id, name) {
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }
</script>
<%--Modal detail--%>
<div class="modal" id="deleteModal1" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Chi tiết khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <p>ID customer: <span id="customerIdDetail"></span></p>
                    <p>Name customer: <span id="customerNameDetail"></span></p>
                    <p>Create Datetime: <span id="customerCreateAtDetail"></span></p>
                    <p>Update Datetime: <span id="customerUpdateAtDetail"></span></p>
                </div>
            </form>
        </div>
    </div>
</div>
<footer style="margin-top: 50px">
    <jsp:include page="/header_footer/footer.jsp"></jsp:include>
</footer>
<script>
    function infoDelete(id, name, account) {
        document.getElementById("customerId").value = id;
        document.getElementById("nameAccount").value = account;
        document.getElementById("deleteName").innerText = name;
    }

    function infoDetail(id, name, createAt, updateAt) {
        document.getElementById("customerIdDetail").innerText = id;
        document.getElementById("customerNameDetail").innerText = name;
        document.getElementById("customerCreateAtDetail").innerText = createAt;
        document.getElementById("customerUpdateAtDetail").innerText = updateAt;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>
</body>
</html>
