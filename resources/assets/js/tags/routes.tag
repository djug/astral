require("./loginscreen.tag");
require("./dashboard/dashboard.tag");
<routes>
  <div id="main"></div>

  import ls from "local-storage";

  this.currentTag = null;
  riot.route("/", () => {
    this.routeTag("login-screen");
  });
  riot.route("/auth", () => {
    this.routeTag("login-screen", {authenticated: true});
  });
  riot.route("/dashboard", () => {
    this.routeTag("dashboard", {}, true);
  });

  this.routeTag = (tag, api = {}, protected = false) => {
    if(protected){
      if( !ls("user") ) {
        window.location = "/";
        return false;
      }
    }
    if(this.currentTag !== null){
      this.currentTag.unmount(true);
      this.currentTag = riot.mount("#main", tag, api);
    }
    else {
      this.currentTag = riot.mount("#main", tag, api);
    }
  }
</routes>
