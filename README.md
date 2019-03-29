# Blog tips

###### This is just the readme from the MacroBlog.

## How does it work?
###### Just a few notes on how it works. Delete these section when proper release.

### Adding a blog post (probably safe to do)
To add a blog post, it's dead easy:
* Clone the whole [BESMacro.github.io](https://github.com/BESMacro/BESMacro.github.io/) repo on your computer.
* Use your favorite way to use git (terminal/GUI) to sync your repo (you need to be member of the BESmacro)
* In `BESMacro.github.io/_posts` create a `.md` file named as follow:
  * year-month-day (e.g. 2015-1-1 or 1212-12-12)
  * your-blog-name (e.g. how-to-add-a-blog)
  * The result should look like `2015-1-1-how-to-add-a-blog.md`
* Make sure to add the right header to your post:
```
---
layout: post
title: The title of my blog post (It C0uLD b3 @nyTHING!)
---
```
* Then write your blog post in Markdown. If you need to add images, you can add the in `BESMacro.github.io/images` and embed them as `![_config.yml]({{ site.baseurl }}/images/YourNicePicture.jpg)`
* Finaly, just sync your repo and push your new blog post. It'll magically appear!

### Creating new pages in the upper bar menu (WARNING: can break the internet)
It's possible to add pages to the menu (i.e. "About", "How to post") this way:
* duplicate one of the *menu* folder (such as "about" or "howto") in `BESMacro.github.io/_site`
* add a `.md` file in the root (`BESMacro.github.io/`) with the same name as the *menu* folder
* be sure the start the `.md` file with the right header
```
---
layout: page
title: The title of the new page
permalink: /<menu_folder>/
---
```
* then add the page to the [default template](https://github.com/BESMacro/BESMacro.github.io/blob/master/_layouts/default.html) in the `<body><nav>`:

````
<...>
   <nav>
      <a href="{{ site.baseurl }}/">Blog</a>
      <a href="{{ site.baseurl }}/about">About</a>
      <a href="{{ site.baseurl }}/howto">How to post</a>
      <a href="{{ site.baseurl }}/legal">Legal Mumbo Jumbo</a>
      <a href="{{ site.baseurl }}/your_new_page">The page name</a>
   </nav>
<...>
````
Note that the order of where the page is in the `<nav>` will be where the link to the page will actually appear.

* finaly build the website using (be sure you installed [all the dependencies](https://help.github.com/articles/using-jekyll-with-pages/)):
```
 bundle exec jekyll serve
```

### Changing some design features (WARNING: can break the internet - big time!)
* `_config.yml` is the yamal file that contains easy fixable details for the whole website (title, description, bottom bar buttons, etc..)
* `_layout/` contains the templates for the layout (e.g. blog posts, main page, etc...)
* `_sass/` contains the scss files (namely `_variables.scss` that you should use to set the template variables)
* `style.scss` is the Jekyll *css-like* file  (if you wanna break some things, that's the place to go!)
The savest way to play with these is to do it on your internal server using `bundle exec jekyll serve`. Note however for changes in the yamal file you have to refresh the localhost each time. If you're happy with your messing up, just sync the repo and push!



jekyll serve --watch
