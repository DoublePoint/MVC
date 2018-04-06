<%/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ：2018年4月6日 
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/bootstrap-3.3.7/dist/css/bootstrap.min.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/bootstrap-table-develop/dist/bootstrap-table.css" media="all">

<script src="${pageContext.request.contextPath}/template/js/jquery-1.9.1.js" charset="utf-8"></script>
<script rel="stylesheet" href="${pageContext.request.contextPath}/template/bootstrap-3.3.7/dist/js/bootstrap.min.js" media="all"></script>
<script rel="stylesheet" href="${pageContext.request.contextPath}/template/bootstrap-table-develop/dist/bootstrap-table.min.js" media="all"></script>
<script rel="stylesheet" href="${pageContext.request.contextPath}/template/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js" media="all"></script>
</head>
<body>
 <div class="container">
        <h1>From data</h1>
        <p></p>
        <table id="table">
            <thead>
            <tr>
                <th data-field="id">ID</th>
                <th data-field="name">Item Name</th>
                <th data-field="price">Item Price</th>
            </tr>
            </thead>
        </table>
    </div>
    <script>
    var $table = $('#table');

    $(function () {
        var data = [
            {
                "id": 0,
                "name": "Item 0",
                "price": "$0"
            },
            {
                "id": 1,
                "name": "Item 1",
                "price": "$1"
            },
            {
                "id": 2,
                "name": "Item 2",
                "price": "$2"
            },
            {
                "id": 3,
                "name": "Item 3",
                "price": "$3"
            },
            {
                "id": 4,
                "name": "Item 4",
                "price": "$4"
            },
            {
                "id": 5,
                "name": "Item 5",
                "price": "$5"
            }
        ];
        $table.bootstrapTable({data: data});
    });
</script>
</body>
</html>