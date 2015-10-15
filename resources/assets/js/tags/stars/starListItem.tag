<star-list-item>
  <li class="repo draggable" each={opts.stars} onclick={showStarDetails}>
    <h3 class="repo-name">{full_name}</h3>
    <div class="repo-description">{description}</div>
    <ul class="repo-tags" show={true}>
      <li each={new Array(3)}>Foo</li>
    </ul>
    <div class="repo-stats">
      <div class="repo-stat stars"><i class="fa fa-star"></i> {stargazers_count}</div>
      <div class="repo-stat forks"><i class="fa fa-code-fork"></i> {forks_count}</div>
      <div class="repo-stat link"><a href="{html_url}" onclick={parent.openRepoLink}>View on GitHub</a></div>
    </div>
  </li>
  import RiotControl from "riotcontrol";
  import $ from "jquery";

  this.openRepoLink = (e) => {
    e.stopPropagation();
    window.open($(e.target).attr("href"), "_blank");
  }

  this.showStarDetails = (e) => {
    $(e.currentTarget).addClass("active").siblings().removeClass("active");
    RiotControl.trigger("star_selected", e.item);
  }

</star-list-item>
