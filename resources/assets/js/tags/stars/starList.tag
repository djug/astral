require("./starListItem.tag");
<star-list>
  <div class="dashboard-repos">
    <ul class="repos">
      <star-list-item stars={stars} />
    </ul>
  </div>

  var RiotControl = require("riotcontrol");

  this.stars = [];
  RiotControl.on("stars_fetched", (stars) => {
    this.stars = stars;
    this.update();
  });
  this.on("mount", () => {
    RiotControl.trigger("stars_requested");
  });
</star-list>
