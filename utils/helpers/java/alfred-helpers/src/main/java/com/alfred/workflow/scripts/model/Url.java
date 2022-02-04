package com.alfred.workflow.scripts.model;

/**
 * @author Johnkegd
 */
public class Url {
    private String originPath;
    private String resultPath;
    public Url(String resultPath) {
        this.resultPath = resultPath;
    }

    public String getOriginPath() {
        return originPath;
    }
    public void setOriginPath(String originPath) {
        this.originPath = originPath;
    }

    public String getResultPath() {
        return resultPath;
    }
    public void setResultPath(String resultPath) {
        this.resultPath = resultPath;
    }
}
