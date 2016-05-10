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
//            for (String line : responseData) {
            System.out.print("Server Response:::" + line);
//            }

            JsonParser jsonParser = new JsonParser();
            JsonElement element = jsonParser.parse(line);

            response.setContentType("application/json");
// Get the printwriter object from response to write the required json object to the output stream
            PrintWriter out = response.getWriter();
// Assuming your json object is **jsonObject**, perform the following, it will return your json object
            out.print(element);
            out.flush();

//            Map<String, String> data = new HashMap<String, String>();
//            data.put("UserID", name);
//            data.put("password", password);
//            System.out.println("***********************************" + name + " " + password);
//
//            String url = "https://kdcbchemdrweb2.bchydro.bc.ca/eMeterRestWebApi/api/DemandResponseIsUser";
//            String charset = "UTF-8";
//            String param1 = name;
//            String param2 = password;
//            String boundary = "---------------------------" + System.currentTimeMillis();
//            String query = String.format("param1=%s&param2=%s",
//                    URLEncoder.encode(param1, charset),
//                    URLEncoder.encode(param2, charset));
//
//
//            StringBuffer responseBuffer = new StringBuffer();
//
//            //Create connection
//            connection = (HttpURLConnection) new URL(url).openConnection();
//            connection.setRequestMethod("POST");
//            connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
//            connection.setRequestProperty("Connection", "Keep-Alive");
//            connection.setDoOutput(true);
//            connection.setDoInput(true);
//
//            //Send request
//            DataOutputStream wr = new DataOutputStream( connection.getOutputStream());
//
//            //Populate Form object
//            String formdataTemplate = "Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}";
//
//            Set keys = data.keySet();
//            Iterator keyIter = keys.iterator();
//            String content = "";
//
//            for(int i=0; keyIter.hasNext(); i++) {
//                Object key = keyIter.next();
//                if(i!=0) {
//                    content += "&";
//                }
//                content += key + "=" + URLEncoder.encode(data.get(key), "UTF-8");
//            }
//
////            for(int i=0; keyIter.hasNext(); i++) {
////                Object key = keyIter.next();
////                if(i!=0) {
////                    content += "&";
////                }
////                content += key + "=" + URLEncoder.encode(data.get(key), "UTF-8");
////            }
//
//            System.out.println(content);
//            wr.writeBytes(content);
//            wr.flush();
//            wr.close();
//
//
//            //Get Response
//            InputStream is = connection.getInputStream();
//            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
//            String line;
//
//            while ((line = rd.readLine()) != null) {
//                responseBuffer.append(line);
//                responseBuffer.append('\r');
//                System.out.println(line);
//            }
//            rd.close();
//            responseBuffer.toString();
//
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {
//            if (connection != null) {
//                connection.disconnect();
//            }
        }
    }

}
