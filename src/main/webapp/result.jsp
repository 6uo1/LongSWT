<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Commission Result</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
    <div class="money-rain">
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
    <span>&#36;</span>
</div>
<div class="page-wrapper">
    <div class="luxury-card">

        <div class="brand">
            <div class="brand-badge">Group 5</div>
            <h1>Commission Result</h1>
            <p>Your calculated sales commission</p>
        </div>
        <div class="success-badge">
    Calculation Completed
</div>

        <table class="result-table">
            <tr>
                <td>Employee Type</td>
                <td>${employeeType}</td>
            </tr>

            <tr>
                <td>Item Type</td>
                <td>${itemType}</td>
            </tr>

            <tr>
                <td>Customer Type</td>
                <td>${customerType}</td>
            </tr>

            <tr>
                <td>Item Price</td>
                <td>$${itemPrice}</td>
            </tr>
        </table>

        <div class="commission-box">
            <div class="commission-label">Final Commission</div>
            <div class="commission-value">$${commission}</div>
        </div>

        <a href="index.jsp" class="back-link">
            Calculate Again
        </a>

    </div>
</div>

</body>
</html>