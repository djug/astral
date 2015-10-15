import riot from "riot";
import superagent from "superagent";

function UserStore() {
  riot.observable(this);

  this.user = {};
  this.on("user_updated", (user) => {
    this.user = user;
  });

  this.on("fetch_user", () => {
    this.fetchUser();
  });

  this.fetchUser = () => {
    superagent.get("/api/auth/user").end((err, res) => {
      this.user = JSON.parse(res.text);
      this.trigger("user_fetched", this.user);
    });
  }
}

if(typeof(module) !== "undefined"){ module.exports = UserStore; }
