# Ruby URL Shortener

This project is a URL shortener built on Rails, TailwindCSS and Postgres.
It allows you to shorten long URLs for easier sharing, and get a report for your shortlink's visitor's.

## Architecture

This application follows the MVC (Model-View-Controller) architecture pattern.

## Installation Guide

1. Clone the repository to your local machine using git clone <repository-url>.
2. Navigate to the project directory using cd <project-directory>.
3. Install the required dependencies using bundle install.
4. Run the application `bin/dev`.
5. Run the test suite 'Rails test`

## Dependencies

This project uses the following dependencies:

- PostgreSQL: Database used to store shortned URLs information.
- Geocoder: A gem for obtaining the geographic information for urls visited.
- Pagy: For pagination
- ChartKick: A charts to display links report.
- Tailwind CSS: Tailwind CSS is a utility-first CSS framework for rapidly building modern websites.

## Scaffolding Tools

- Bundler: Used for managing Ruby gems.

## CICD

Added gitlab actions that runs the rails test suite and automates the deployment process, once the tests pipeline has passed.

## Deployment

This project is deployed using [Render](https://render.com/).
The application is deployed at <deployed-application-url>. You can use the application by navigating to this URL in your web browser.
