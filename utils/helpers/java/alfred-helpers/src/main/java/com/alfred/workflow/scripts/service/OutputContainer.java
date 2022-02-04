package com.alfred.workflow.scripts.service;

import java.io.IOException;

/**
 * @author Johnkegd
 */
public interface OutputContainer {
    void createFileContainer(String fileName) throws IOException;
}
