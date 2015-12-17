<copyfield>
  <input type="text" value={opts.value} class="copyfield" readonly />
  import $ from "jquery";
  this.on("mount", () => {
    $(".copyfield").on("click", (e) => {
      $(e.currentTarget).focus().select();
    });
    $(".copyfield-trigger").on("click", (e) => {
      $(e.currentTarget).next("copyfield").children(".copyfield").focus().select();
    });
  });
</copyfield>
