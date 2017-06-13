# seOSINT
### Search Engine Open Source Intelligence
A lot of internal URLs of websites are indexed without the knowledge of Developer or SEO. And during an web security assessment sounds ridiculous to spend the day clicking from page to page on Google search looking for something relevant (aka leak).

Based on the premise that something repetitive must be automated, I'm working in seosint, an Open Source Intelligence tool focused on automating the search for holes in Search Engine Optimization projects.


#### Functions partially working:
Search for url's on Google

#### TODO
* Add Banner
* Switch Google Domain if reCaptcha
* Change User-Agent
* Save in sqlite3 db with Site title, Description and Cache Page
* Remove (or make like) ads

Search Engines to add
* Bing
* Yahoo
* DuckDuckGo


#### Use Example
```bash
$ sh seosint.sh www.topseos.com
https://www.topseos.com/
https://www.topseos.com/downloads/
https://www.topseos.com/profile/boostability/
https://www.topseos.com/google/acquisitions/
https://www.topseos.com/sitemap/
https://www.topseos.com/disclosure/
https://www.topseos.com/registration/
https://www.topseos.com/conferences/
https://www.topseos.com/blog/
https://www.topseos.com/apply-for-rankings-research/
https://www.topseos.com/profile/ganpatizone/
https://www.topseos.com/profile/prbuzz/
https://www.topseos.com/profile/pagetraffic/
https://www.topseos.com/profile/webimax/
https://www.topseos.com/profile/seop/
https://www.topseos.com/profile/baligatra/
https://www.topseos.com/profile/zoek/
https://www.topseos.com/profile/arwebcom/
https://www.topseos.com/profile/staylisted/
http://www.topseos.com/profile/sentinia/
[...]
More than 600 lines in 0m5.072s

```
