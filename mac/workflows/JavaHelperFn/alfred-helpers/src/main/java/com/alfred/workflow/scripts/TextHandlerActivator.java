package com.alfred.workflow.scripts;

import com.alfred.workflow.scripts.service.TextHandler;

import java.io.IOException;

/**
 * @author Johnkegd
 */
public class TextHandlerActivator {

    public static void main(String[] args) throws IOException {
        TextHandler textHandler = new TextHandler();
        textHandler.handleText(args[0]);
    }
}
