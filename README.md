# A URL Shortener project built on Ruby on Rails

## This application allows users to create shortened URLs for their target URLs and provide analytics report on visitors engagement with these links.

## [Live Demo](https://url-shortener-c3t7.onrender.com/)

This project is developed on Ruby on Rails 7, TailwindCSS and PostgreSQL. This project should allow the user to perform:

- View a list of shortened URL's by other users with the page's title
- Create a shortened URL given target URL
- Let users copy the created shorted URL
- Provide url report for visitor details such as geolocation & timestamp
- Same target URL can have different short URLs
- Check out [Wiki](https://github.com/calvenwts/url-shortener/wiki) for solution details, limitations and workarounds discussion.

## Installation Guide

### clone the repository

```shell
git clone https://github.com/calvenwts/url-shortener.git
cd url-shortener
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.2.4` (or your ruby version differs)

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv):

```shell
rbenv install 3.2.4
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle install
```

## Serve

```shell
bin/dev
```

## CI/CD & Deployment

This project is deployed using [Render](https://render.com/).
When commits are merged to `main` [github actions workflow](https://github.com/calvenwts/url-shortener/actions) will deploy this application once the tests in this project has passed using a render deployment hook.

## Dependencies

This project uses the following dependencies:

- **PostgreSQL:** A robust and scalable database solution for storing and managing information about shortened URLs.
- **Geocoder:** A powerful Ruby gem that provides geolocation data, enabling the tracking of geographic information for visited URLs.
- **Pagy:** A lightweight and fast pagination gem used for efficiently displaying data across multiple pages.
- **Chartkick:** An intuitive charting library that visually represents link viewer details through dynamic and interactive charts.
- **Tailwind CSS:** A highly customizable, utility-first CSS framework designed for building sleek, responsive user interfaces quickly.
