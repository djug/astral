riot = require("riot");
<login-screen>
  <div class="login-status">
    <div class="login-status-wrap" hide={true}>
      <div class="login-status-text">
        Signing In
      </div>
      <div class="pulser"></div>
    </div>
    <div class="login-container">
      <img src="images/logo.svg" alt="Astral">
        <a class="btn-auth" href="#" onclick={authenticate}>Sign In</a>
    </div>
  </div>

  import RiotControl from "riotcontrol";

  this.authenticate = () => { window.location.href = '/api/auth'; }

  RiotControl.on("user_fetched", (user) => {
    riot.route('#/dashboard');
  });

  this.on("mount", () => {
    if(opts.authenticated){
      RiotControl.trigger("fetch_user");
    }
  });

</login-screen>
