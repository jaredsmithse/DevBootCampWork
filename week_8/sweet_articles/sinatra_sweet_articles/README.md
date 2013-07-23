Company Sweet Articles just hired you as a contractor to move their existing Sinatra app to Rails. This is the project summary:

Sweet Articles started as a simple app to share the sweetest articles with the world. We never expected that we'd grow so fast
especially that our app has super basic features, actually it pretty much has no features. We grew to 10,000 users and we're ready to take
our app to the next level. We heard about this framework called Rails and we want you to:
  1) migrate our existing app from Sinatra to Rails
  2) add new sweet features

Here are some constraints/requirements to keep in mind:

- we absolutely CAN NOT lose data, you need to migrate the data over to the new rails app and make the data available.
- We need to introduce categories and assign articles to categories, currently the categories are saved in the articles table
  and they are a mess. We have things like Business/business and computer world/computer-world. We need to clean it up and
  remove it from the articles table.
- our current articles url format is "articles/month/day/year/title", we want to change it to: "/categories/category_name/articles/article_title".
  Here is the trick, we need to support the current article urls that are spread accross the interwebs. The rails app has to support
  the old as well as the new url formats.
- Since we're changing our url format, we need to transfer the article creation date (currently in the url) to some column in
  the database that we can retrieve/reference.
- tags: similar situation with cateogries, we need to clean them up and more importantly we need to be able to link them.
  so when I click on a tag, I want all the articles listed under that tag. They also need to be cleaned up.
- tests: we got none! Let's at least add unit tests, we heard that's important.


We understand that migrating data can be a pain, so we want to make it easier on you. We would be totally OK if you decided to
create a dummy table called old_articles, populate it with old data and use it to migrate to the new table(s). After you're done,
drop the dummy table. To get the current articles, we created this rake task under db:seed in the Sinatra app that does that magic for you
and populate the articles table with all of our sweet articles, use that in the rails app as well.


If you're done with the migration and the app works as described above, we would LOVE it if you:
- make the app prettier:
  - sidebar with categories
  - nicer looking article show page
  - we're SO old school and we'd love a tag cloud
- currently to add an article, our authors have to manually add stuff to the database. Can you please provide a way to
  add/edit/delete articles, we won't say no to a rich text editor.
- icing on the cake:
  - ability to have users and only logged in users can add/edit/delete
  - ability to edit the articles url (only the title part).



