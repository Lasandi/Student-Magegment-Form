package com.example.demo7;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.IOException;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the employee ID to be deleted
        String employeeId = request.getParameter("employeeId");

        // Parse the XML file
        DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = null;
        try {
            docBuilder = docFactory.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            throw new RuntimeException(e);
        }

        // Replace the hardcoded file path with the correct path to your XML file
        String filePath = getServletContext().getRealPath("/") + "/employeeData.xml";
        Document doc = null;
        try {
            doc = docBuilder.parse(new File(filePath));
        } catch (SAXException e) {
            throw new RuntimeException(e);
        }

        // Find the employee element with the matching ID
        NodeList employeeNodes = doc.getElementsByTagName("employee");
        Element employeeElement = null;
        for (int i = 0; i < employeeNodes.getLength(); i++) {
            Element node = (Element) employeeNodes.item(i);
            if (node.getAttribute("id").equals(employeeId)) {
                employeeElement = node;
                break;
            }
        }

        // Check if the employee was found
        if (employeeElement != null) {
            // Remove the employee element from the XML file
            doc.getDocumentElement().removeChild(employeeElement);

            // Save the updated XML file
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = null;
            try {
                transformer = transformerFactory.newTransformer();
            } catch (TransformerConfigurationException e) {
                throw new RuntimeException(e);
            }
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File(filePath));
            try {
                transformer.transform(source, result);
            } catch (TransformerException e) {
                throw new RuntimeException(e);
            }

            // Redirect the user back to the EmployeeData.jsp page
            response.sendRedirect("EmployeeDataServlet");
        } else {
            // Handle the case where the employee with the specified ID was not found
            response.sendRedirect("EmployeeData.jsp?error=EmployeeNotFound");
        }
    }
}
