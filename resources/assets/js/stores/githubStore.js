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

  this.on("readme_requested", (repo) => {
    this.getRepoReadme(repo);
  });

  this.getGithubStars = (page=1) => {
    let currentPage = page;
    superagent.get("/api/github/stars?page=" + page).end((err, res) => {
      if(res.error) {
        if(err.status === 401) {
          riot.route("/");
        }
      }
      res = JSON.parse(res.text);
      this.stars = res.stars
      if(res.page_count) {this.totalPages = res.page_count;}
      if(res.cached) {this.cachedPages = res.cached;}
      if(this.cachedPages && this.cachedPages === this.totalPages) {
        this.trigger("stars_fetched", this.stars);
        return false;
      }
      else {
        if(this.cachedPages){
          currentPage += 1;
        }
        else {
          currentPage++;
        }
      }
      if(currentPage <= this.totalPages) {
        this.trigger("stars_fetched", this.stars);
        this.getGithubStars(currentPage);
      }
      else {
        this.trigger("stars_fetched", this.stars);
      }
    });
  }

  this.getRepoReadme = (repo) => {
    superagent.get(`/api/github/repo/${repo.owner.login}/${repo.name}/readme`).end( (err, res) => {
      let readme = JSON.parse(res.text).readme;
      this.trigger("readme_fetched", readme);
    });
  }

}

if(typeof(module) !== "undefined") { module.exports = GithubStore; }
