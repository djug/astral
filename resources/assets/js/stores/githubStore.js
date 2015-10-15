import riot from "riot";
import superagent from "superagent";

function GithubStore() {
  riot.observable(this);

  this.totalPages = 0;
  this.cachedPages = 0;
  this.stars = [];

  this.on("stars_requested", () => {
    this.getGithubStars();
  });

  this.getGithubStars = (page=1) => {
    let currentPage = page;
    superagent.get("/api/github/stars?page=" + page).end((err, res) => {
      res = JSON.parse(res.text);
      console.log(res);
      this.stars = res.stars
      if(res.page_count.length) {this.totalPages = res.page_count;}
      if(res.cached) {this.cachedPages = res.cached;}
      if(this.cachedPages.length && this.cachedPages === this.totalPages) {
        this.trigger("stars_fetched", this.stars);
      }
      else {
        if(this.cachedPages.length){
          currentPage += 1;
        }
        else {
          currentPage++;
        }
      }
      if(currentPage <= this.totalPages) {
        this.trigger("stars_fetched", this.stars);
        this.getGithubStars(currentPage)
      }
      else {
        this.trigger("stars_fetched", this.stars);
      }
    });
  }
}

if(typeof(module) !== "undefined") { module.exports = GithubStore; }
