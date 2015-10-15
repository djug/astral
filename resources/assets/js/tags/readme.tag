<readme>
  <span></span>
  import hljs from "highlight.js";
  import $ from "jquery";

  this.on("mount update", () => {
    this.root.innerHTML = opts.content;
    setTimeout( () => {
      $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
      });
    }, 0);
  });
</readme>
