package com.emetering;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * Created by mijo on 2016-05-10.
 */
@WebServlet("/login")
public class HandlerServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpURLConnection connection = null;
        try {
            String name = request.getParameter("UserID");
            String password = request.getParameter("password");
            System.out.println("***********************************" + name + " " + password);

            String url = "https://kdcbchemdrweb2.bchydro.bc.ca/eMeterRestWebApi/api/DemandResponseIsUser";
            String charset = "UTF-8";
            String param1 = name;
            String param2 = password;
            String query = String.format("param1=%s&param2=%s",
                    URLEncoder.encode(param1, charset),
                    URLEncoder.encode(param2, charset));


            StringBuffer responseBuffer = new StringBuffer();

            //Create connection
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Accept-Charset", charset);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + charset);

            //Send request
            DataOutputStream wr = new DataOutputStream(
                    connection.getOutputStream());
            wr.writeBytes(query);
            wr.flush();
            wr.close();


            //Get Response
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            String line;

            while ((line = rd.readLine()) != null) {
                responseBuffer.append(line);
                responseBuffer.append('\r');
            }
            rd.close();
            responseBuffer.toString();

//            try (OutputStream output = connection.getOutputStream()) {
//                output.write(query.getBytes(charset));
//            }
//
//
//            OutputStream wr = connection.getOutputStream();
//            InputStream in = request.getInputStream();
//
//            byte[] buffer = new byte[512];
//            int read = in.read(buffer, 0, buffer.length);
//            while (read >= 0) {
//                wr.write(buffer, 0, read);
//                read = in.read(buffer, 0, buffer.length);
//            }
//            wr.flush();
//            wr.close();
//
//            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//            String inputLine;
//            while ((inputLine = bufferedReader.readLine()) != null) {
//                jb.append(inputLine);
//            }
//
//            response.setContentType("text/html");
//            // Get the printwriter object from response to write the required json
//            // object to the output stream
//            PrintWriter out = response.getWriter();
//            // Assuming your json object is **jsonObject**, perform the following,
//            // it will return your json object
//            out.print(jb.toString());
//            out.flush();
//            bufferedReader.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }
}
