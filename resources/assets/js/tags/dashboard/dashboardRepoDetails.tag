require("../readme.tag");
<dashboard-repo-details>
  <div class="dashboard-repo-details">
    <div class="empty-placeholder" hide={readme}>No Repo Selected</div>
    <div class="empty-placeholder" hide={true}>No Readme For {star.full_name}</div>
    <div class="manage-star" show={Object.keys(star).length}>
      <div class="edit-star-tags">
        <button class="toggle-tag-editor"><i class="fa fa-tag"></i> Edit Tags</button>
        <div class="tags-dropdown" hide={true}>
          <input type="text" value="" placeholder="Tags">
          <button class="save-tags btn-flat">Save Tags</button>
        </div>
      </div>
      <button class="unstar-repo"><i class="fa fa-star-o"></i> Unstar</button>
      <div class="clone-url">
        <label for="txtGitHubCloneURL">Clone:</label>
        <input type="text" id="txtGitHubCloneURL" value="{star.ssh_url}" readonly/>
      </div>
    </div>
    <div class="readme-loading-overlay" hide={true}>
      <spinner color="#658399"></spinner>
    </div>
    <readme class="repo-readme" content={readme} />
  </div>

  import RiotControl from "riotcontrol";
  this.star = {};
  this.readme = "";

  RiotControl.on("star_selected", (star) => {
    this.star = star;
    RiotControl.trigger("readme_requested", this.star);
    this.update();
  });

  RiotControl.on("readme_fetched", (readme) => {
    this.readme = readme;
    this.update();
  });
</dashboard-repo-details>
