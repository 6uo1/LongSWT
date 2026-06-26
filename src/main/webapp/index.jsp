<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Group 5 Commission Calculator</title>
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
                    <h1>Commission Calculator</h1>
                    <p> Commission calculation system</p>
                </div>

                <% if (request.getAttribute("error") != null) {%>
                <div class="error">
                    <%= request.getAttribute("error")%>
                </div>
                <% }%>

                <form action="calculate" method="post">

                    <div class="form-group">
                        <label>Employee Type</label>
                        <select name="employeeType" required>
                            <option value="" disabled selected>Select employee type...</option>
                            <option value="SALARIED">Salaried Salesperson</option>
                            <option value="NON_SALARIED">Non-salaried Salesperson</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Item Type</label>
                        <select name="itemType" required>
                                <option value="" disabled selected>Select item type...</option>

                            <option value="STANDARD">Standard Item</option>
                            <option value="BONUS">Bonus Item</option>
                            <option value="OTHER">Other Item</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Customer Type</label>
                        <select name="customerType" required>
                                <option value="" disabled selected>Select customer type...</option>

                            <option value="REGULAR">Regular Customer</option>
                            <option value="NON_REGULAR">Non-regular Customer</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Item Price ($)</label>
                       <input type="number" name="itemPrice" step="0.01" min="0.01"
       placeholder="Enter item price..." required>
                    </div>

                    <button type="submit" class="btn-gold">
                        Calculate Commission
                    </button>
                </form>

                <div class="note">
                    Standard items or sales to regular customers receive no commission.
                    Bonus and other items are calculated based on employee type and price.
                </div>

            </div>
        </div>

    </body>
</html>