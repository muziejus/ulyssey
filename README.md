Ulyssey
===============

Ulyssey is a Twitter bot that uses Ruby to make a mashup of the texts of *Ulysses* and *The Odyssey*. It is based on [@KarlMarxovChain](https://github.com/muziejus/karlmarxovchain), and like that bot, it uses the Twitter API to talk to twitter.

It looks for a file called "configs.yml" which should look like this:

```
---
:since_id: {some Twitter id}
:consumer_key: {Gibberish from Twitter}
:consumer_secret: {Gibberish from Twitter}
:access_token: {Gibberish from Twitter}
:access_token_secret: {Gibberish from Twitter}
```

Mine is obviously in my .gitignore. 

This is the first twitter bot I'm writing that uses actual NLP (as opposed to simply Markov chain silliness). The goal is to have it do a few different things, maybe choosing one at random. For example:

* Do NER on both texts and replace a proper name in one with one in another. And tweet.

* Swap out dependent clauses. And tweet.

* Do some other kind of manipulation. And tweet.

For the true heads, I'm using Butler's [prose translation of Homer](http://www.gutenberg.org/cache/epub/1727/pg1727.txt) because prose and Joyce's [version of the novel he wrote](http://www.gutenberg.org/cache/epub/4300/pg4300.txt). Thanks to Project Gutenberg. Now if only you had Stein's *The Making of Americans*, I'd really be cooking with gas. But on a different project.

Finally, I summon this via a cron command that looks like this:

```
*/2 * * * * cd $BOT_HOME/ulyssey ; /complex/rvm/path/to/ruby run_bot.rb >> cron.log 2>&1 
```
