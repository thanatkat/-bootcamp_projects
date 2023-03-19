# -*- coding: utf-8 -*-

# -- Sheet --

library(dplyr)
library(tidyverse)
library(lubridate)
flights <- read.csv("flights.csv")
airlines <- read.csv("airlines.csv")
planes <- read.csv("planes.csv")
weather <- read.csv("weather.csv")

# Q1: What are the top destinations for flights departing from a particular airport?

flights %>%
    count(dest) %>%
    arrange(desc(n)) %>%
    rename(count_destination = n) %>%
    head(1)

# Q2 What is the average flight time for flights between different pairs of airports?

flights %>%
    select(dep_delay) %>%
    filter(dep_delay >= 0) %>%
    summarise(avg_departure_delay = mean(dep_delay))

# Q3 What are the most common routes flown by airlines operating out of a particular airport?

flights %>%
    select(origin , dest) %>%
    group_by(origin, dest) %>%
    count(dest) %>%
    arrange(desc(n)) %>%
    head(1)

# Q4 Sort flights to find the fastest flights.

# find velocity v = s/t : s = dest, t = air_time

flights %>%
    select(flight, distance, air_time) %>%
    mutate(velocity = distance/air_time) %>%
    arrange(desc(velocity)) %>%
    head(1)

# Q5 Which model is the most depart from a particular airport ?

flights %>%
    filter(month == 10) %>%
    inner_join(planes, "tailnum") %>%
    count(model) %>%
    rename(num = n) %>%
    arrange(desc(num)) %>%
    head(1)
    

# Q6 What are the busiest days of the week for flights departing from a particular airport?

flights %>%
    select(year, month, day) %>%
    mutate(departure = make_date(year, month, day)) %>%
    mutate(date = wday(departure, label=T, abbr = F)) %>%
    count(date) %>%
    rename(total = n) %>%
    arrange(desc(total))



