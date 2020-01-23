---
author: cacadosman
date: 2018-07-20 16:28:56+00:00
draft: false
title: Create Blog With Github Pages
type: post
url: /olc-cyber-security-1-dasar-python-dan-kripto/
comments: true
categories:
- Tutorial
- Web Dev
---

Hi readers, i want to share some tutorials how to create a blog without spending any money :D  

I know we don't like to spending our money to buy some shit like this hahaha, so this is the best solution for you that want to have a free blog. However, free doesn't mean easy to do :)  

You need to have some coding skills to create something like this. But don't worry, i'll teach you how to do.  
  

**Requirements**






  * Ruby Gems
  * Jekyll
  * Bundler




**How to**





First, install Jekyll and Bundler using ruby gems:




    
    <code>gem install jekyll bundler
    </code>





Second, create new project named `blog`:




    
    <code>jekyll new blog
    </code>





You can create or edit a new post on `_posts` folder and edit your configuration on `_config.yml` file.  






Third, install github-pages:  

Create a file called `Gemfile` and paste this into the file:




    
    <code>source 'https://rubygems.org'
    gem 'github-pages', group:jekyll_plugins
    </code>





After that, execute this command:




    
    <code>bundle install
    </code>





Now, we have to compile and serve:




    
    <code>bundle exec jekyll serve
    </code>





Default URL is set to `https://localhost:4000/` in development.  

Congratulations, you have successfully created your blog :)





Now, you have to upload to your github repositories. Create a repository named `username.github.io` and upload your blog folder using git remote or something else.





Thanks.



