package com.emetering;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by mijo on 2016-05-10.
 */
@WebServlet("/login")
public class HandlerServlet extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = null;
        try {
            String name = request.getParameter("UserID");
            String password = request.getParameter("password");
            String charset = "UTF-8";
            String url = "https://kdcbchemdrweb2.bchydro.bc.ca/eMeterRestWebApi/api/DemandResponseIsUser";


            MultipartUtility multipart = new MultipartUtility(url, charset);
            multipart.addFormField("UserID", name.trim());
            multipart.addFormField("password", password);

            List<String> responseData = multipart.finish();
            String line = responseData.get(0);
            System.out.print("******************SERVER REPLIED:");
            System.out.print("Server Response:::" + line);

            JsonParser jsonParser = new JsonParser();
            JsonElement element = jsonParser.parse(line);

            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream
            out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object
            out.print(element);
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {
            out.close();
        }
    }

}
