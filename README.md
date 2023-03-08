# Description
Clone application of once upon a time famous [**AskFM**](https://ask.fm/).

## Supported features
- Registration&Authorization.
- Avatar setup (automatic) ([**Gravatar**](https://github.com/chrislloyd/gravtastic).
- Hashtags.

## Setup
1. Required Ruby (v. 3.1.2) & Rails (v. 7) installed on your PC.
2. Clone application to local PC:
```
git clone git@github.com:Godlikefreq/Askme.git
```
4. Run
```
bundle install
```

### Database setup
1. To specify database name, adapter and other parameters for different scopes change it in `config/database.yml`. 
Default DB adapter is **SQLite** ([**Install SQLite3 on Ubuntu 20.04**](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-sqlite-on-ubuntu-20-04)).
2. Run
```
bundle exec rails db:migrate
```

## Run locally
1. To run application on your local machine run following command in console:
```
rails s
```
2. Open `http://localhost:3000/` in your browser.

## Live demo of working app
[**Application here**](http://askme.mylessondomain.ru/)

## Sources
- Made and tested on **Ruby 3.1.2** & **Rails 7**
