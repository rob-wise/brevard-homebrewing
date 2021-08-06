from django.shortcuts import render

from django.views.generic import TemplateView


class HomePageView(TemplateView):
    template_name = "home.html"

class EventsPageView(TemplateView):
    template_name = "events.html"

class AboutsPageView(TemplateView):
    template_name = "about.html"