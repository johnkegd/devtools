package com.alfred.workflow.scripts.service;

import java.io.FileOutputStream;
import java.io.IOException;

/**
 * @author Johnkegd
 */
public class TextHandler implements OutputContainer {
    private static String output;

    public void handleText(String text) throws IOException {

        if(!text.isEmpty()) {
            int charRange = text.charAt(0);

            if (charRange < 90) {
                output = text.substring(0,1).toLowerCase().concat(text.substring(1));


            } else {
                output = text.substring(0,1).toUpperCase().concat(text.substring(1));
            }
            System.out.println(output);
            createFileContainer("text-out.txt");
        }
    }

    public void createFileContainer(String fileName) throws IOException {
        FileOutputStream fos = new FileOutputStream("filesOutput/".concat(fileName));
        fos.write(output.getBytes());
        fos.close();
    }
}
