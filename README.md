# Overview

This repository contains a possible solution for the PostCo. problem set. It's quite barebones with only two additional required gems on top of the default ones that come with Rails.

## Requirements
- Ruby 2.7.2
- Rails 6.0.3.4
- Bundler 2.1.4

Note that this was tested only on [elementaryOS](https://github.com/elementary) 6 (which is based on Ubuntu 20.04).

## Getting started

To get started, you'll need to clone this repository via

```bash
git clone https://github.com/pongloongyeat/postco-problem-set.git
cd postco-problem-set
```

Once within the project directory, run `bundler install` to install all necessary gems and then push the migrations via `rails db:migrate`.

This project has not yet been configured for production [(#33)](https://github.com/pongloongyeat/postco-problem-set/issues/33) so in the mean time, run
```bash
rails s
```
to get it up and running at `localhost:3000`.

## User guide for branch shop owners

If you're a Tapir Grocer branch, welcome to the family! To get contact tracing set up for your customers, simply click on "Contact tracing" on the navbar and sign up! Use your special Tapir Grocer-given email to sign up (or just use your own email) and specify your branch location name. Then, choose a super secret password and you're good to go!

Once signed up, login and you'll see the list of users that have entered Tapir Grocer. To start contact tracing in your shop, simply pass them the "New Customer" link or click on "Generate QR code for this branch location" (recommended). This directs you to the QR code page where it contains your branch location name, a very friendly message for the customer as well as the QR code. You may print this out and put it up in front of your shop where it's visible for your customers.
