require("../readme.tag");
require("../copyfield.tag");
<dashboard-repo-details>
  <div class="dashboard-repo-details">
    <div class="empty-placeholder" hide={readme}>No Repo Selected</div>
    <div class="empty-placeholder" hide={true}>No Readme For {star.full_name}</div>
    <div class="manage-star" show={Object.keys(star).length}>
      <div class="edit-star-tags">
        <button class="toggle-tag-editor"><i class="fa fa-tag"></i> Edit Tags</button>
        <button class="toggle-tag-editor"><i class="fa fa-sticky-note-o"></i> Edit Notes</button>
        <div class="tags-dropdown" hide={true}>
          <input type="text" value="" placeholder="Tags">
          <button class="save-tags btn-flat">Save Tags</button>
        </div>
      </div>
      <button class="unstar-repo"><i class="fa fa-star-o"></i> Unstar</button>
      <div class="clone-url">
        <label for="txtGitHubCloneURL" class="copyfield-trigger">Clone:</label>
        <copyfield value="{star.ssh_url}" id="txtGitHubCloneURL">
      </div>
    </div>
    <div class="readme-loading-overlay" show={readmeLoading}>
      <spinner color="#658399"></spinner>
    </div>
    <readme class="repo-readme" content={readme} />
  </div>

  import RiotControl from "riotcontrol";
  this.star = {};
  this.readme = "";
  this.readmeLoading = false;

  RiotControl.on("star_selected", (star) => {
    this.star = star;
    this.readmeLoading = true;
    RiotControl.trigger("readme_requested", this.star);
    this.update();
  });

  RiotControl.on("readme_fetched", (readme) => {
    this.readmeLoading = false;
    this.readme = readme;
    this.update();
  });
</dashboard-repo-details>
