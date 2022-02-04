package com.johnkegd.future;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * @author johnkegd
 */
public class EventSource {
    public interface Observer {
        void update(String event);
    }

    private final List<Observer> observers = new ArrayList<>();

    private void notifyObservers(String event) {
        observers.forEach(observer -> {
            observer.update(event);
        });
    }

    public void addObserver(Observer observer) {
        this.observers.add(observer);
    }

    public void readInput() {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            String line = sc.nextLine();
            this.notifyObservers(line);
        }
    }
}
