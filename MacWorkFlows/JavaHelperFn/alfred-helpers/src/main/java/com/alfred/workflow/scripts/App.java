package com.alfred.workflow.scripts;

import com.alfred.workflow.scripts.service.UrlService;
import java.io.IOException;

/**
 * @author Johnkegd
 */
public class App {
    private static String [] test = {"http://localhost:4512/editor.html/content/forms/af/textbox-bug-ef-13905.html?wcmmode=disabled"};

    public static void main(String[] args) throws IOException {
        UrlService urlService = new UrlService();
        urlService.fillUrlsToParse(args);
        urlService.createFileContainer("filesOutput/out.txt");
    }
}
