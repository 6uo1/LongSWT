package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CustomerType;
import model.EmployeeType;
import model.ItemType;
import service.CommissionService;

import java.io.IOException;

@WebServlet(name = "CommissionServlet", urlPatterns = {"/calculate"})
public class CommissionServlet extends HttpServlet {

    private final CommissionService commissionService = new CommissionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String employeeTypeRaw = request.getParameter("employeeType");
            String itemTypeRaw = request.getParameter("itemType");
            String customerTypeRaw = request.getParameter("customerType");
            String itemPriceRaw = request.getParameter("itemPrice");

            EmployeeType employeeType = EmployeeType.valueOf(employeeTypeRaw);
            ItemType itemType = ItemType.valueOf(itemTypeRaw);
            CustomerType customerType = CustomerType.valueOf(customerTypeRaw);
            double itemPrice = Double.parseDouble(itemPriceRaw);

            double commission = commissionService.calculateCommission(
                    employeeType,
                    itemType,
                    customerType,
                    itemPrice
            );

            request.setAttribute("employeeType", employeeType);
            request.setAttribute("itemType", itemType);
            request.setAttribute("customerType", customerType);
            request.setAttribute("itemPrice", String.format(java.util.Locale.US, "%,.2f", itemPrice));
            request.setAttribute("commission", String.format(java.util.Locale.US, "%,.2f", commission));

            request.getRequestDispatcher("result.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Item price must be a valid number.");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Unexpected error occurred.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
