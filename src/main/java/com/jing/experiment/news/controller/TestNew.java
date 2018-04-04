package com.jing.experiment.news.controller;

public enum TestNew {
    controller;
    private NewsController news;

    private TestNew() {
        news = new NewsController();
    }

    public NewsController getNewsController() {
        return news;
    }


}
